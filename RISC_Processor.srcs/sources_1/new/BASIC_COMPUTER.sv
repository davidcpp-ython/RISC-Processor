`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/01/2025 04:51:18 PM
// Design Name: 
// Module Name: BASIC_COMPUTER
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module BASIC_COMPUTER(
    input logic clk,
    input logic rst
    );
    
    logic [7:0] addr_read;
    logic [31:0] instr;
    logic [31:0] instr_mem [0:255];
    logic [15:0] data_mem_addr_read;
    logic [15:0] data_mem_addr_write;
    logic [15:0] data_mem_data_read;
    logic [7:0] instr_mem_addr_read;
    logic data_mem_w_en;
    logic [15:0] data_mem [0:65_535];
    logic [15:0] data_mem_data_write;
    
    
    always_ff @(posedge clk) begin
        instr <= instr_mem[instr_mem_addr_read];
    end
    
    assign data_mem_data_read = data_mem[data_mem_addr_read];
    
    always_ff @(posedge clk) begin
        if(data_mem_w_en == 1)
            data_mem[data_mem_addr_write] <= data_mem_data_write;
    end
    
    
    PROCESSOR cpu (
        .clk(clk),
        .rst(rst),
        .instr_mem_data_read(instr),
        .data_mem_data_read(data_mem_data_read),
        .data_mem_w_en(data_mem_w_en),
        .instr_mem_addr_read(instr_mem_addr_read),
        .data_mem_data_write(data_mem_data_write),
        .data_mem_addr_write(data_mem_addr_write),
        .data_mem_addr_read(data_mem_addr_read)
    );
    
    
    
endmodule
