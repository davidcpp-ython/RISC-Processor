`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2025 02:14:55 PM
// Design Name: 
// Module Name: REGISTER_FILE
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


module REGISTER_FILE(
    input logic clk,
    input logic w_en,
    input logic [3:0] addr_operand0,
    input logic [3:0] addr_operand1,
    input logic [3:0] addr_result,
    input logic [15:0] data_write,
    output logic [15:0] operand0,
    output logic [15:0] operand1
    );
    
    logic [15:0] register[0:15];
    
    always_comb
        begin
            operand0 = register[addr_operand0];
            operand1 = register[addr_operand1];
        end
    
    always_ff @(posedge clk)
        begin     
            if(w_en == 1)
                register[addr_result] <= data_write;    
            
        end
    
endmodule
