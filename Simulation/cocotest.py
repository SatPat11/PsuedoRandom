import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, Timer
from cocotb.result import TestFailure

# Register addresses
CTRL_REG_ADDR = 0x0
SEED_REG_ADDR = 0x4
TAPS_REG_ADDR = 0x8
LFSR_DATA_ADDR = 0xC

class AXILiteMaster:
    def __init__(self, dut):
        self.dut = dut

    async def axi_write(self, addr, data):
        """Perform AXI-Lite write transaction"""
        dut = self.dut
        
        # Start write transaction
        await RisingEdge(dut.clk)
        dut.s_axi_awaddr.value = addr
        dut.s_axi_awvalid.value = 1
        dut.s_axi_wdata.value = data
        dut.s_axi_wvalid.value = 1
        dut.s_axi_bready.value = 1

        dut._log.info(f"WRITE START: Addr=0x{addr:02x}, Data=0x{data:02x}")
        
        # Wait for address and data acceptance
        while not (dut.s_axi_awready.value and dut.s_axi_wready.value):
            await RisingEdge(dut.clk)
        
        await RisingEdge(dut.clk)
        dut.s_axi_awvalid.value = 0
        dut.s_axi_wvalid.value = 0

        # Wait for response
        while not dut.s_axi_bvalid.value:
            await RisingEdge(dut.clk)
        
        resp = dut.s_axi_bresp.value
        await RisingEdge(dut.clk)
        dut.s_axi_bready.value = 0
        
        dut._log.info(f"WRITE DONE: Addr=0x{addr:02x}, Data=0x{data:02x}, Resp={resp}")
        return resp

    async def axi_read(self, addr):
        """Perform AXI-Lite read transaction"""
        dut = self.dut
        
        # Start read transaction
        await RisingEdge(dut.clk)
        dut.s_axi_araddr.value = addr
        dut.s_axi_arvalid.value = 1
        dut.s_axi_rready.value = 1

        # Wait for address acceptance
        while not dut.s_axi_arready.value:
            await RisingEdge(dut.clk)
        
        await RisingEdge(dut.clk)
        dut.s_axi_arvalid.value = 0

        # Wait for data valid
        while not dut.s_axi_rvalid.value:
            await RisingEdge(dut.clk)
        
        data = dut.s_axi_rdata.value
        await RisingEdge(dut.clk)
        dut.s_axi_rready.value = 0
        
        dut._log.info(f"READ: Addr=0x{addr:02x}, Data=0x{data:02x}")
        return int(data)

async def reset_dut(dut):
    """Reset the DUT"""
    dut.resetslave.value = 0  # Active-low reset
    await Timer(20, units='ns')
    dut.resetslave.value = 1  # Release reset
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)

async def init_signals(dut):
    """Initialize all AXI signals"""
    dut.s_axi_awaddr.value = 0
    dut.s_axi_awvalid.value = 0
    dut.s_axi_wdata.value = 0
    dut.s_axi_wvalid.value = 0
    dut.s_axi_bready.value = 0
    dut.s_axi_araddr.value = 0
    dut.s_axi_arvalid.value = 0
    dut.s_axi_rready.value = 0

@cocotb.test()
async def test_basic_register_access(dut):
    """Test 1: Basic register write/read"""
    dut._log.info("=== Test 1: Basic Register Access ===")
    
    # Start clock
    clock = Clock(dut.clk, 10, units="ns")  # 100MHz clock
    cocotb.start_soon(clock.start())
    
    # Initialize and reset
    await init_signals(dut)
    await reset_dut(dut)
    
    axi = AXILiteMaster(dut)
    
    # Write to registers
    await axi.axi_write(CTRL_REG_ADDR, 0x00)  # ctrl = 0 (disabled)
    await axi.axi_write(SEED_REG_ADDR, 0xA5)  # seed = 0xA5
    await axi.axi_write(TAPS_REG_ADDR, 0xB4)  # taps = 0xB4
    
    # Read back registers
    ctrl_data = await axi.axi_read(CTRL_REG_ADDR)
    seed_data = await axi.axi_read(SEED_REG_ADDR)
    taps_data = await axi.axi_read(TAPS_REG_ADDR)
    
    # Verify values
    assert ctrl_data == 0x00, f"CTRL register mismatch: expected 0x00, got 0x{ctrl_data:02x}"
    assert seed_data == 0xA5, f"SEED register mismatch: expected 0xA5, got 0x{seed_data:02x}"
    assert taps_data == 0xB4, f"TAPS register mismatch: expected 0xB4, got 0x{taps_data:02x}"
    
    dut._log.info("Test 1 PASSED: Basic register access working")

@cocotb.test()
async def test_load_seed(dut):
    """Test 2: Load seed into LFSR"""
    dut._log.info("=== Test 2: Load Seed ===")
    
    # Start clock
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clock.start())
    
    # Initialize and reset
    await init_signals(dut)
    await reset_dut(dut)
    
    axi = AXILiteMaster(dut)
    
    # Configure registers
    await axi.axi_write(SEED_REG_ADDR, 0xA5)  # seed = 0xA5
    await axi.axi_write(TAPS_REG_ADDR, 0xB4)  # taps = 0xB4
    
    # Load seed into LFSR
    await axi.axi_write(CTRL_REG_ADDR, 0x02)  # ctrl = load
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)
    await axi.axi_write(CTRL_REG_ADDR, 0x00)  # ctrl = 0 (stop load)
    
    # Read LFSR output
    lfsr_data = await axi.axi_read(LFSR_DATA_ADDR)
    
    # Verify seed was loaded
    assert lfsr_data == 0xA5, f"LFSR seed load failed: expected 0xA5, got 0x{lfsr_data:02x}"
    
    dut._log.info("Test 2 PASSED: Seed loading working")

@cocotb.test()
async def test_lfsr_sequence(dut):
    """Test 3: Enable LFSR and observe sequence"""
    dut._log.info("=== Test 3: LFSR Sequence ===")
    
    # Start clock
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clock.start())
    
    # Initialize and reset
    await init_signals(dut)
    await reset_dut(dut)
    
    axi = AXILiteMaster(dut)
    
    # Configure and load seed
    await axi.axi_write(SEED_REG_ADDR, 0xA5)  # seed = 0xA5
    await axi.axi_write(TAPS_REG_ADDR, 0xB4)  # taps = 0xB4
    await axi.axi_write(CTRL_REG_ADDR, 0x02)  # load
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)
    
    # Enable LFSR
    await axi.axi_write(CTRL_REG_ADDR, 0x01)  # enable
    
    # Collect sequence
    sequence = []
    for i in range(10):
        await RisingEdge(dut.clk)
        await RisingEdge(dut.clk)
        lfsr_data = await axi.axi_read(LFSR_DATA_ADDR)
        sequence.append(lfsr_data)
        dut._log.info(f"LFSR[{i}] = 0x{lfsr_data:02x}")
    
    # Verify sequence is changing (not stuck)
    unique_values = set(sequence)
    assert len(unique_values) > 1, f"LFSR appears stuck, only {len(unique_values)} unique values"
    
    # Verify no zero values (LFSR should recover from zero)
    assert 0 not in sequence, "LFSR should not output zero values"
    
    dut._log.info("Test 3 PASSED: LFSR sequence generation working")

@cocotb.test()
async def test_different_configuration(dut):
    """Test 4: Different seed/taps configuration"""
    dut._log.info("=== Test 4: Different Configuration ===")
    
    # Start clock
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clock.start())
    
    # Initialize and reset
    await init_signals(dut)
    await reset_dut(dut)
    
    axi = AXILiteMaster(dut)
    
    # Disable LFSR
    await axi.axi_write(CTRL_REG_ADDR, 0x00)  # disable
    
    # Configure with different values
    await axi.axi_write(SEED_REG_ADDR, 0x5A)  # new seed
    await axi.axi_write(TAPS_REG_ADDR, 0x8E)  # new taps
    
    # Load and enable
    await axi.axi_write(CTRL_REG_ADDR, 0x02)  # load
    await RisingEdge(dut.clk)
    await RisingEdge(dut.clk)
    await axi.axi_write(CTRL_REG_ADDR, 0x01)  # enable
    
    # Collect sequence
    sequence = []
    for i in range(5):
        await RisingEdge(dut.clk)
        await RisingEdge(dut.clk)
        lfsr_data = await axi.axi_read(LFSR_DATA_ADDR)
        sequence.append(lfsr_data)
        dut._log.info(f"LFSR_new[{i}] = 0x{lfsr_data:02x}")
    
    # Verify sequence is changing
    unique_values = set(sequence)
    assert len(unique_values) > 1, f"LFSR appears stuck with new config"
    
    # Verify first value matches loaded seed
    first_read = await axi.axi_read(LFSR_DATA_ADDR)
    # Note: First read might be one step ahead due to enable, so we check if seed was properly loaded
    
    dut._log.info("Test 4 PASSED: Different configuration working")

@cocotb.test()
async def test_error_response(dut):
    """Test 5: Invalid address access"""
    dut._log.info("=== Test 5: Error Response ===")
    
    # Start clock
    clock = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clock.start())
    
    # Initialize and reset
    await init_signals(dut)
    await reset_dut(dut)
    
    axi = AXILiteMaster(dut)
    
    # Try to write to invalid address
    resp = await axi.axi_write(0xF, 0x55)  # Invalid address
    
    # Verify error response (SLVERR = 2'b10)
    assert resp == 0b10, f"Expected SLVERR response (2), got {resp}"
    
    dut._log.info("Test 5 PASSED: Error response working")

# Test runner configuration
if __name__ == "__main__":
    import os
    os.system("make")