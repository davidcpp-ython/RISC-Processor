`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2025 04:01:40 PM
// Design Name: 
// Module Name: RALU
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


module RALU(
    input logic clk,
    input logic [3:0] opcode,
    input logic [3:0] addr_operand0,
    input logic [3:0] addr_operand1,
    input logic w_en,
    input logic  [3:0] addr_result,
    input logic [15:0] data_mem_data_read,
    input logic [15:0] instr_value,
    output logic [15:0] operand0,
    output logic [15:0] operand1,
    output logic [15:0] result,
    output logic zero_flag
    );
    
    logic [15:0] reg_op0;
    logic [15:0] reg_op1;
    logic [15:0] data_write;
    
    
    REGISTER_FILE reg_file (
        .clk(clk),
        .addr_operand0(addr_operand0),
        .addr_operand1(addr_operand1),
        .w_en(w_en),
        .addr_result(addr_result),
        .data_write(data_write),
        .operand0(reg_op0),
        .operand1(reg_op1)
    );
    
    logic [15:0] mux_op1;
    
        always_comb
            begin
                case(opcode)
                    4'b1010: mux_op1 = instr_value;
                    4'b1011: mux_op1 = instr_value;
                    4'b1100: mux_op1 = instr_value;
                    4'b1110: mux_op1 = data_mem_data_read;
                    default: mux_op1 = reg_op1;
                endcase
            end 
    
    logic zero;
    
     ALU alu_unit (
        .operand0(reg_op0),
        .operand1(mux_op1),
        .opcode(opcode),
        .result(data_write),
        .zero(zero)
     );
     
     always_ff @(posedge clk)
        begin
            zero_flag <= zero;
        end
    
    always_comb
        begin
            result = data_write;
            operand0 = reg_op0;
            operand1 = mux_op1;        
        end
    
endmodule
