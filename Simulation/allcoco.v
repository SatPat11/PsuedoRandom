`timescale 1ns / 1ps

// LFSR Core Module
module LFSR_core(
    input clk,
    input rst,        // active-high reset
    input enable,
    input [7:0] seed,
    input load,
    input [7:0] taps,
    output reg [7:0] lfsr_out
);
    
    wire feedback;
    wire lfsr_stuck_zero;
    
    assign feedback = ^(lfsr_out & taps);
    assign lfsr_stuck_zero = (lfsr_out == 8'b00000000);
    
    always @(posedge clk) begin
        if (rst) begin
            lfsr_out <= 8'h19;  // Default seed 0x19
        end
        else if (load) begin
            lfsr_out <= seed;    // Load new seed
        end
        else if (enable) begin
            if (lfsr_stuck_zero) begin
                lfsr_out <= 8'h19;  // Recovery from stuck-at-zero
            end
            else begin
                lfsr_out <= {lfsr_out[6:0], feedback};  // Shift left with feedback
            end
        end
        // If neither load nor enable, hold current value
    end
    
endmodule

// AXI-Lite Slave Module
module lfsr_axi_slave #(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 8
)(
    input clk,
    input resetn,  // active-low reset
   
    // Write Address Channel
    input  [ADDR_WIDTH-1:0] s_axi_awaddr,
    input                   s_axi_awvalid,
    output reg              s_axi_awready,
   
    // Write Data Channel
    input  [DATA_WIDTH-1:0] s_axi_wdata,
    input                   s_axi_wvalid,
    output reg              s_axi_wready,
    
    // Write Response Channel
    output reg [1:0]        s_axi_bresp,
    output reg              s_axi_bvalid,
    input                   s_axi_bready,
    
    // Read Address Channel
    input  [ADDR_WIDTH-1:0] s_axi_araddr,
    input                   s_axi_arvalid,
    output reg              s_axi_arready,
   
    // Read Data Channel
    output reg [DATA_WIDTH-1:0] s_axi_rdata,
    output reg              s_axi_rvalid,
    input                   s_axi_rready,
    
    // Register interface
    output reg [7:0] ctrl_reg,
    output reg [7:0] seed_reg,
    output reg [7:0] taps_reg,
    input  [7:0]     lfsr_data
);

    // AXI Write State Machine
    localparam WRITE_IDLE  = 2'b00,
               WRITE_DATA  = 2'b01,
               WRITE_RESP  = 2'b10;
    
    reg [1:0] write_state;
    reg [ADDR_WIDTH-1:0] write_addr;
    
    // AXI Read State Machine  
    localparam READ_IDLE = 1'b0,
               READ_DATA = 1'b1;
    
    reg read_state;

    // Write Channel Logic
    always @(posedge clk) begin
        if (!resetn) begin
            write_state   <= WRITE_IDLE;
            s_axi_awready <= 1'b0;
            s_axi_wready  <= 1'b0;
            s_axi_bvalid  <= 1'b0;
            s_axi_bresp   <= 2'b00;
            write_addr    <= 0;
            ctrl_reg      <= 8'h00;
            seed_reg      <= 8'h00;
            taps_reg      <= 8'h00;
        end else begin
            case (write_state)
                WRITE_IDLE: begin
                    s_axi_awready <= 1'b1;
                    s_axi_wready  <= 1'b1;
                    s_axi_bvalid  <= 1'b0;
                    
                    if (s_axi_awvalid && s_axi_wvalid) begin
                        write_addr    <= s_axi_awaddr;
                        s_axi_awready <= 1'b0;
                        s_axi_wready  <= 1'b0;
                        write_state   <= WRITE_DATA;
                    end
                end
                
                WRITE_DATA: begin
                    // Perform the write
                    case (write_addr[3:0])
                        4'h0: begin 
                            ctrl_reg <= s_axi_wdata;
                            s_axi_bresp <= 2'b00; // OK
                        end
                        4'h4: begin 
                            seed_reg <= s_axi_wdata;
                            s_axi_bresp <= 2'b00; // OK
                        end
                        4'h8: begin 
                            taps_reg <= s_axi_wdata;
                            s_axi_bresp <= 2'b00; // OK
                        end
                        default: begin
                            s_axi_bresp <= 2'b10; // SLVERR
                        end
                    endcase
                    
                    s_axi_bvalid <= 1'b1;
                    write_state  <= WRITE_RESP;
                end
                
                WRITE_RESP: begin
                    if (s_axi_bready) begin
                        s_axi_bvalid <= 1'b0;
                        write_state  <= WRITE_IDLE;
                    end
                end
                
                default: write_state <= WRITE_IDLE;
            endcase
        end
    end

    // Read Channel Logic
    always @(posedge clk) begin
        if (!resetn) begin
            read_state    <= READ_IDLE;
            s_axi_arready <= 1'b0;
            s_axi_rvalid  <= 1'b0;
            s_axi_rdata   <= 8'h00;
        end else begin
            case (read_state)
                READ_IDLE: begin
                    s_axi_arready <= 1'b1;
                    s_axi_rvalid  <= 1'b0;
                    
                    if (s_axi_arvalid) begin
                        s_axi_arready <= 1'b0;
                        
                        // Decode address and provide data
                        case (s_axi_araddr[3:0])
                            4'h0: s_axi_rdata <= ctrl_reg;
                            4'h4: s_axi_rdata <= seed_reg;
                            4'h8: s_axi_rdata <= taps_reg;
                            4'hC: s_axi_rdata <= lfsr_data;
                            default: s_axi_rdata <= 8'h00;
                        endcase
                        
                        s_axi_rvalid <= 1'b1;
                        read_state   <= READ_DATA;
                    end
                end
                
                READ_DATA: begin
                    if (s_axi_rready) begin
                        s_axi_rvalid <= 1'b0;
                        read_state   <= READ_IDLE;
                    end
                end
                
                default: read_state <= READ_IDLE;
            endcase
        end
    end

endmodule

// Top Module
module lfsr_axi_top #(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 8
)(
    input clk,
    input resetslave,  // active-low reset
    
    // AXI-Lite Slave Interface
    input  [ADDR_WIDTH-1:0] s_axi_awaddr,
    input                   s_axi_awvalid,
    output                  s_axi_awready,
    input  [DATA_WIDTH-1:0] s_axi_wdata,
    input                   s_axi_wvalid,
    output                  s_axi_wready,
    output [1:0]            s_axi_bresp,
    output                  s_axi_bvalid,
    input                   s_axi_bready,
    
    input  [ADDR_WIDTH-1:0] s_axi_araddr,
    input                   s_axi_arvalid,
    output                  s_axi_arready,
    output [DATA_WIDTH-1:0] s_axi_rdata,
    output                  s_axi_rvalid,
    input                   s_axi_rready
);
    
    // Internal signals
    wire [7:0] ctrl_reg, seed_reg, taps_reg, lfsr_out;
    wire enable, load, rst_lfsr;
    
    // Extract control signals
    assign enable = ctrl_reg[0];
    assign load   = ctrl_reg[1];
    assign rst_lfsr = ~resetslave;  // Convert to active-high
    
    // Instantiate AXI-Lite slave
    lfsr_axi_slave #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) u_axi_slave (
        .clk(clk),
        .resetn(resetslave),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_awready(s_axi_awready),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wvalid(s_axi_wvalid),
        .s_axi_wready(s_axi_wready),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_bready(s_axi_bready),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_arready(s_axi_arready),
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_rready(s_axi_rready),
        .ctrl_reg(ctrl_reg),
        .seed_reg(seed_reg),
        .taps_reg(taps_reg),
        .lfsr_data(lfsr_out)
    );
    
    // Instantiate LFSR core
    LFSR_core u_lfsr (
        .clk(clk),
        .rst(rst_lfsr),
        .enable(enable),
        .load(load),
        .seed(seed_reg),
        .taps(taps_reg),
        .lfsr_out(lfsr_out)
    );
    
endmodule



// CocoTB Testbench - Only DUT instantiation
module tb_lfsr_axi_cocotb;

    parameter ADDR_WIDTH = 4;
    parameter DATA_WIDTH = 8;

    reg clk;
    reg resetslave;

    // AXI signals
    reg  [ADDR_WIDTH-1:0] s_axi_awaddr;
    reg                   s_axi_awvalid;
    wire                  s_axi_awready;

    reg                   s_axi_wvalid;
    reg  [DATA_WIDTH-1:0] s_axi_wdata;
    wire                  s_axi_wready;

    wire                  s_axi_bvalid;
    reg                   s_axi_bready;
    wire [1:0]            s_axi_bresp;

    reg  [ADDR_WIDTH-1:0] s_axi_araddr;
    reg                   s_axi_arvalid;
    wire                  s_axi_arready;

    wire                  s_axi_rvalid;
    reg                   s_axi_rready;
    wire [DATA_WIDTH-1:0] s_axi_rdata;

    // DUT instantiation
    lfsr_axi_top #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) dut (
        .clk(clk),
        .resetslave(resetslave),
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_awready(s_axi_awready),
        .s_axi_wvalid(s_axi_wvalid),
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wready(s_axi_wready),
        .s_axi_bready(s_axi_bready),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_bresp(s_axi_bresp),
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_arready(s_axi_arready),
        .s_axi_rready(s_axi_rready),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_rdata(s_axi_rdata)
    );

    // Clock generation for CocoTB
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // VCD dump for debugging
    initial begin
        $dumpfile("tb_lfsr_axi_cocotb.vcd");
        $dumpvars(0, tb_lfsr_axi_cocotb);
    end

endmodule

endmodule