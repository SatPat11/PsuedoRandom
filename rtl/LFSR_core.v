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