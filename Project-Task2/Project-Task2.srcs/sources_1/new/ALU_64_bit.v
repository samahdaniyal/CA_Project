`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2024 10:51:21 PM
// Design Name: 
// Module Name: ALU_64_bit
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


module ALU_64_bit(
    input [63:0] A,
    input [63:0] B,
    input [3:0] ALUOp,
    output reg [63:0] Result,
    output reg Zero
    );
    
always @(*) begin
    case (ALUOp)
        4'b0000: Result = A & B;
        4'b0001: Result = A | B;
        4'b0010: Result = A + B;
        4'b0110: Result = A - B;
        4'b1100: Result = ~(A | B);
    endcase
    if (Result == 64'd0) Zero = 1'b1;
    else Zero = 1'b0;
end
endmodule
