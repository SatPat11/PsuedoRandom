`timescale 1ns / 1ps

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