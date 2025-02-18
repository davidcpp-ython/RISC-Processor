`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/03/2025 04:07:32 PM
// Design Name: 
// Module Name: TESTBENCH
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


module TESTBENCH(

    );
    
    logic clk, rst;
    
    BASIC_COMPUTER dut (
        .clk(clk),
        .rst(rst)
    );
    
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end
    
    initial begin
        rst = 1;
        @(posedge clk);
        rst = 0;
    end
    
    initial begin
        dut.instr_mem[0] = 32'b0000_0000_0000_0000_0000_0000_0000_0000; // NOP
        dut.instr_mem[1] = 32'b1010_0101_0000_0000_0000_0000_0000_0010; // VALUE LOAD R[5] = 2
        dut.instr_mem[2] = 32'b0000_0000_0000_0000_0000_0000_0000_0000; // NOP
        dut.instr_mem[3] = 32'b1010_0110_0000_0000_0000_0000_0000_0100; // VALUE LOAD R[6] = 4
        dut.instr_mem[4] = 32'b0000_0001_0101_0110_0000_0000_0000_0000; // ADD R[0] = R[5] + R[6]

        // Run simulation
        #100;
        $finish;
    end
    
    
endmodule
