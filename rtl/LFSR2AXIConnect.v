`timescale 1ns / 1ps

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