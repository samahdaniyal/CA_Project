`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2024 10:56:46 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
    input [63:0] Inst_Address,
    output reg [31:0] Instruction
);
    reg [7:0] inst_mem [11:0];

    initial 
        begin
            {inst_mem[3], inst_mem[2], inst_mem[1], inst_mem[0]} = 32'h003100b3; 
            // add x1 x2 x3
            {inst_mem[7], inst_mem[6], inst_mem[5], inst_mem[4]} = 32'h00308133; 
            // add x2 x1 x3
            {inst_mem[11], inst_mem[10], inst_mem[9], inst_mem[8]} = 32'h00108193; 
            // addi x3 x1 1      
        end

    always @(Inst_Address)
        Instruction <= {inst_mem[Inst_Address + 3], inst_mem[Inst_Address + 2], inst_mem[Inst_Address + 1], inst_mem[Inst_Address]};

endmodule
