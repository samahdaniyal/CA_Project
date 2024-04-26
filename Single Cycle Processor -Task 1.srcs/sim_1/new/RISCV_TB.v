`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 10:44:35 AM
// Design Name: 
// Module Name: RISCV_TB
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


module RISCV_TB();
    reg clk, reset; 
    wire [63:0] PC_In, PC_Out, ReadData1, ReadData2, WriteData, Result, Read_Data, imm_data; 
    wire [31:0] Instruction; 
    wire [6:0] opcode; 
    wire [4:0] rs1, rs2, rd; 
    wire [1:0] ALUOp; 
    wire [63:0] adder_out1, adder_out2; 
    wire Branch, MemRead, MemWrite, MemtoReg, ALUSrc, RegWrite, addermuxselect;
    wire [63:0] output0, output1, output2, output3, output4;
    
    RiscV_processor riscv(clk, reset,
        PC_In, PC_Out, ReadData1, ReadData2, WriteData, Result, Read_Data, imm_data,
        Instruction,
        opcode,
        rs1, rs2, rd,
        ALUOp,
        adder_out1, adder_out2,
        Branch, MemRead, MemWrite, MemtoReg, ALUSrc, RegWrite, addermuxselect,
        output0, output1, output2, output3, output4);
    
    initial begin
    clk = 0; reset = 1'b1;
    #5 reset = 0;
    end
    
    always
        #5 clk = ~clk;

endmodule
