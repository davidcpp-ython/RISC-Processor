`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2025 01:48:44 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input logic [3:0] opcode,
    input logic [15:0] operand0,
    input logic [15:0] operand1,
    output logic [15:0] result,
    output logic zero
    );
    
    
    always_comb
        begin
            case(opcode)
                4'b0001: result = operand0 + operand1;
                4'b0010: result = operand0 - operand1;
                4'b0011: result = operand0 * operand1;
                4'b0100: result =   operand1 >> 1;
                4'b0110: result = operand0 & operand1;
                4'b0111: result = operand0 | operand1;
                4'b1000: result = operand0 ^ operand1;
                4'b1010: result = operand1;
                4'b1011: result = operand1;
                4'b1100: result = operand1;
                4'b1101: result = operand0;
                4'b1110: result = operand1;
                default: result = 1'b0;
             endcase
                zero = (result == 0);
        end
    
    
    
endmodule
