`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2024 10:57:00 PM
// Design Name: 
// Module Name: instruction_parser
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


module instruction_parser(
input [31:0] Instruction,
    output [6:0] Opcode,
    output [4:0] RD,
    output [2:0] Funct3,
    output [4:0] RS1,
    output [4:0] RS2,
    output [6:0] Funct7
    );
    assign Opcode = Instruction[6:0];
    assign RD = Instruction[11:7];
    assign Funct3 = Instruction[14:12];
    assign RS1 = Instruction[19:15];
    assign RS2 = Instruction[24:20];
    assign Funct7 = Instruction[31:25];
endmodule
