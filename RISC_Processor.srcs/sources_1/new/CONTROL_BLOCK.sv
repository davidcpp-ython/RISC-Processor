`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2025 06:15:41 PM
// Design Name: 
// Module Name: CONTROL_BLOCK
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


module CONTROL_BLOCK(
    input logic [3:0] opcode,
    input logic zero_flag,
    output logic ralu_w_en,
    output logic pc_en,
    output logic do_jump,
    output logic data_mem_w_en
    );
    
//    logic ralu_w;
//    logic pc;
//    logic jump;
//    logic data_mem_w;
    
    always_comb begin
        ralu_w_en = 1;
        pc_en = 1;
        do_jump = 0;
        data_mem_w_en = 0;
        case(opcode)
            4'b000: begin
                ralu_w_en = 0;
                pc_en = 0;
            end
            4'b1011: begin
                do_jump = 1;
            end            
            4'b1100: begin
                do_jump = (zero_flag == 1);
            end
            4'b1110: begin
                data_mem_w_en = 1;
            end             
            4'b1111: begin
                pc_en = 0;
            end
        endcase
    end
    
endmodule
