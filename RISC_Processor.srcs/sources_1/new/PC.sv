`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2025 04:41:47 PM
// Design Name: 
// Module Name: PC
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


module PC(
    input logic clk,
    input logic w_en,
    input logic rst,
    input logic do_jump,
    input logic [7:0] jump_value,
    output logic [7:0] pc 
    );
    
    always_ff @(posedge clk)
    begin
        if (rst == 1)
            pc <= 0;         
        else if (do_jump == 1)
            pc <= jump_value;
        else if (w_en == 1)
            pc <= pc + 1;
    end
    
endmodule
