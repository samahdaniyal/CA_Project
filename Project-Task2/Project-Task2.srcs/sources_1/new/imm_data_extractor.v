`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2024 10:52:52 PM
// Design Name: 
// Module Name: imm_data_extractor
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


module imm_data_extractor(
    input [31:0] Instruction, //instrction set
    output reg [63:0] Imm //64-bit extended IS
    );
    wire [1:0] selector_bit;
    reg [11:0] i_imm; //I type immediate
    reg [11:0] s_imm; //S type immediate
    reg [11:0] sb_imm; //SB type immediate
    assign selector_bit = Instruction[6:5];

    always@(Instruction)
    begin
        case(selector_bit)
            2'b00: //when selector bit is 00
             begin
             //I format
             i_imm = Instruction[31:20];
             Imm = {{52{i_imm[11]}}, i_imm[11:0]};
             end
       
            2'b01: //when selector bit is 01
            begin
             //S format
             s_imm = {Instruction[31:25], Instruction[11:7]};
             Imm = {{52{s_imm[11]}}, s_imm[11:0]};
             end
       
            2'b11 || 2'b10: //when selector bit is 11 or 10
            begin
            //SB format
             sb_imm = {Instruction[31], Instruction[7],Instruction[30:25],Instruction[11:8]};
             Imm = {{52{sb_imm[11]}}, sb_imm[11:0]};
             end
       endcase
   end
endmodule
