`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2025 05:03:42 PM
// Design Name: 
// Module Name: PC_TEST
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


module PC_TEST(
    input logic clk,
    input logic rst,
    input logic w_en,
    output logic [7:0] pc
    );
    
    always_ff @(posedge clk)
        begin
            if (rst == 1)
                pc <= 0;
            else if (w_en == 1)
                pc <= pc + 1;
        end            
endmodule
