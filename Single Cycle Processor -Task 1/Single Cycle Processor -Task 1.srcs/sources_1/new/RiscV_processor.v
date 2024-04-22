`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 10:41:01 AM
// Design Name: 
// Module Name: RiscV_processor
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


module RiscV_processor(
    input clk, reset,
    output reg [63:0] PC_In, PC_Out, ReadData1, ReadData2, WriteData, Result, Read_Data, imm_data,
    output reg [31:0] Instruction,
    output reg [6:0] opcode,
    output reg [4:0] rs1, rs2, rd,
    output reg [1:0] ALUOp,
    output reg [63:0] adder_out1, adder_out2,
    output reg Branch, MemRead, MemWrite, MemtoReg, ALUSrc, RegWrite, addermuxselect,
    output reg [63:0] output0, output1, output2, output3, output4
    );

    wire [63:0] PC_In, PC_Out, adder_out1, adder_out2, imm_data, WriteData, ReadData1, ReadData2, Result, Read_Data;
    wire [63:0] muxmid_out;
    wire [31:0] Instruction;
    wire [6:0] opcode, funct7;
    wire [4:0] rd, rs1, rs2;
    wire [3:0] Funct, Operation;
    wire [2:0] funct3;
    wire [1:0] ALUOp;
    wire Branch, MemRead, MemWrite, MemtoReg, ALUSrc, RegWrite, Zero, addermuxselect, branch_sel;
    wire [63:0] output0, output1, output2, output3, output4;
    
    // Instruction Fetch //
    Adder A1(.A(PC_Out), .B(64'd4), .Out(adder_out1));
    MUX_2x1 muxfirst(.A(adder_out1), .B(adder_out2), .S(Branch && addermuxselect), .Out(PC_In));
    Program_Counter PC(.clk(clk), .reset(reset), .PC_In(PC_In), .PC_Out(PC_Out));
    Instruction_Memory IM(.Inst_Address(PC_Out), .Instruction(Instruction));
    
    // Instruction Decode / Register File Read //
    Instruction_Parser IP(.Instruction(Instruction), .Opcode(opcode), .RD(rd), .Funct3(funct3), .RS1(rs1), .RS2(rs2), .Funct7(funct7));
    imm_data_extractor Immgen(.Instruction(Instruction), .Imm(imm_data));
    Control_Unit cu(.Opcode(opcode), .Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg), .ALUOp(ALUOp), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite));
    Register_File rf(.clk(clk), .reset(reset), .WriteData(WriteData), .RS1(rs1), .RS2(rs2), .RD(rd), .RegWrite(RegWrite), .ReadData1(ReadData1), .ReadData2(ReadData2));
    assign Funct = {Instruction[30], Instruction[14:12]};
    
    // Execute / Address Calculation // 
    Adder A2(.A(PC_Out), .B(imm_data * 2), .Out(adder_out2));
    MUX_2x1 muxmid(.A(ReadData2), .B(imm_data), .S(ALUSrc), .Out(muxmid_out));
    ALU_Control aluc(.ALUOp(ALUOp), .Funct(Funct), .Operation(Operation));
    ALU_64_bit ALU(.A(ReadData1), .B(muxmid_out), .ALUOp(Operation), .Result(Result));
    Branch_Unit BU(.Funct3(funct3), .ReadData1(ReadData1), .ReadData2(ReadData2), .addermuxselect(addermuxselect));
    // MEM: Memory Access //
    //Data_Memory DM(.Mem_Addr(Result), .Write_Data(ReadData2), .clk(clk), .MemWrite(MemWrite), .MemRead(MemRead), .Read_Data(Read_Data));
    Data_Memory DM(.clk(clk), .MemWrite(MemWrite), .MemRead(MemRead), .Mem_Addr(Result), .Write_Data(ReadData2), .Read_Data(Read_Data), .output0(output0), .output1(output1), .output2(output2), .output3(output3), .output4(output4));
    // Write Back // 
    MUX_2x1 muxlast(.A(Result), .B(Read_Data), .S(MemtoReg), .Out(WriteData));
endmodule
