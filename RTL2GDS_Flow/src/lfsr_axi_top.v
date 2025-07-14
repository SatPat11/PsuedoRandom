`timescale 1ns / 1ps

// Simplified LFSR Core Module
module lfsr_core(
    input clk,
    input rst_n,        // active-low reset
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
    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
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

// Simplified AXI-Lite Slave Module
module lfsr_axi_slave(
    input clk,
    input rst_n,  // active-low reset
   
    // Write Address Channel
    input  [3:0] s_axi_awaddr,
    input        s_axi_awvalid,
    output reg   s_axi_awready,
   
    // Write Data Channel
    input  [7:0] s_axi_wdata,
    input        s_axi_wvalid,
    output reg   s_axi_wready,
    
    // Write Response Channel
    output reg [1:0] s_axi_bresp,
    output reg       s_axi_bvalid,
    input            s_axi_bready,
    
    // Read Address Channel
    input  [3:0] s_axi_araddr,
    input        s_axi_arvalid,
    output reg   s_axi_arready,
   
    // Read Data Channel
    output reg [7:0] s_axi_rdata,
    output reg       s_axi_rvalid,
    input            s_axi_rready,
    
    // Register interface
    output reg [7:0] ctrl_reg,
    output reg [7:0] seed_reg,
    output reg [7:0] taps_reg,
    input  [7:0]     lfsr_data
);

    // Write address register
    reg [3:0] write_addr;
    
    // Simplified write logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            s_axi_awready <= 1'b1;
            s_axi_wready  <= 1'b1;
            s_axi_bvalid  <= 1'b0;
            s_axi_bresp   <= 2'b00;
            ctrl_reg      <= 8'h00;
            seed_reg      <= 8'h19;
            taps_reg      <= 8'hB8;  // Default polynomial x^8+x^7+x^5+x^4+x^3+1
        end else begin
            // Handle write transaction
            if (s_axi_awvalid && s_axi_wvalid && s_axi_awready && s_axi_wready) begin
                case (s_axi_awaddr[3:0])
                    4'h0: ctrl_reg <= s_axi_wdata;
                    4'h4: seed_reg <= s_axi_wdata;
                    4'h8: taps_reg <= s_axi_wdata;
                endcase
                s_axi_bvalid <= 1'b1;
                s_axi_awready <= 1'b0;
                s_axi_wready <= 1'b0;
            end
            
            // Handle write response
            if (s_axi_bvalid && s_axi_bready) begin
                s_axi_bvalid <= 1'b0;
                s_axi_awready <= 1'b1;
                s_axi_wready <= 1'b1;
            end
        end
    end

    // Simplified read logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            s_axi_arready <= 1'b1;
            s_axi_rvalid  <= 1'b0;
            s_axi_rdata   <= 8'h00;
        end else begin
            // Handle read transaction
            if (s_axi_arvalid && s_axi_arready) begin
                case (s_axi_araddr[3:0])
                    4'h0: s_axi_rdata <= ctrl_reg;
                    4'h4: s_axi_rdata <= seed_reg;
                    4'h8: s_axi_rdata <= taps_reg;
                    4'hC: s_axi_rdata <= lfsr_data;
                    default: s_axi_rdata <= 8'h00;
                endcase
                s_axi_rvalid <= 1'b1;
                s_axi_arready <= 1'b0;
            end
            
            // Handle read response
            if (s_axi_rvalid && s_axi_rready) begin
                s_axi_rvalid <= 1'b0;
                s_axi_arready <= 1'b1;
            end
        end
    end

endmodule

// Top Module
module lfsr_axi_top(
    input clk,
    input rst_n,  // active-low reset
    
    // AXI-Lite Slave Interface
    input  [3:0] s_axi_awaddr,
    input        s_axi_awvalid,
    output       s_axi_awready,
    input  [7:0] s_axi_wdata,
    input        s_axi_wvalid,
    output       s_axi_wready,
    output [1:0] s_axi_bresp,
    output       s_axi_bvalid,
    input        s_axi_bready,
    
    input  [3:0] s_axi_araddr,
    input        s_axi_arvalid,
    output       s_axi_arready,
    output [7:0] s_axi_rdata,
    output       s_axi_rvalid,
    input        s_axi_rready
);
    
    // Internal signals
    wire [7:0] ctrl_reg, seed_reg, taps_reg, lfsr_out;
    wire enable, load;
    
    // Extract control signals
    assign enable = ctrl_reg[0];
    assign load   = ctrl_reg[1];
    
    // Instantiate AXI-Lite slave
    lfsr_axi_slave u_axi_slave (
        .clk(clk),
        .rst_n(rst_n),
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
    lfsr_core u_lfsr (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .load(load),
        .seed(seed_reg),
        .taps(taps_reg),
        .lfsr_out(lfsr_out)
    );
    
endmodule
