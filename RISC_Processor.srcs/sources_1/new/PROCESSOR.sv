`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/31/2025 06:47:56 PM
// Design Name: 
// Module Name: PROCESSOR
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


module PROCESSOR(
    input logic clk,
    input logic rst,
    input logic [31:0] instr_mem_data_read,
    input logic [15:0] data_mem_data_read,
    output logic [15:0] data_mem_addr_read,
    output logic [15:0] data_mem_addr_write,
    output logic [15:0] data_mem_data_write,
    output logic [7:0] instr_mem_addr_read,
    output logic data_mem_w_en
    );
    
    logic zero_flag;
    logic w_en;
    logic pc_en;
    logic do_jump;
    
    RALU ralu_unit (
        .clk(clk),
        .opcode(instr_mem_data_read[31:28]),
        .addr_operand0(instr_mem_data_read[23:20]),
        .addr_operand1(instr_mem_data_read[19:16]),
        .instr_value(instr_mem_data_read[15:0]),
        .addr_result(instr_mem_data_read[27:24]),
        .data_mem_data_read(data_mem_data_read),
        .operand0(data_mem_addr_read),
        .operand1(data_mem_addr_write),
        .result(data_mem_data_write),
        .zero_flag(zero_flag),
        .w_en(w_en)
    );
    
    CONTROL_BLOCK control_block (
        .opcode(instr_mem_data_read[31:28]),
        .zero_flag(zero_flag),
        .ralu_w_en(w_en),
        .pc_en(pc_en),
        .do_jump(do_jump),
        .data_mem_w_en(data_mem_w_en)
    );
    
    
    PC program_counter (
        .clk(clk),
        .rst(rst),
        .w_en(pc_en),
        .do_jump(do_jump),
        .jump_value(data_mem_data_write[7:0]),
        .pc(instr_mem_addr_read)
    );
endmodule
