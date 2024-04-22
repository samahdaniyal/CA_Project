`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 12:59:55 AM
// Design Name: 
// Module Name: MUX_3x1
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


module MUX_3x1(
    input [63:0] A,
    input [63:0] B,
    input [63:0] C,
    input [1:0] S,
    output [63:0] O
);

    assign O = (S==2'b00) ? A: (S==2'b01) ? B: C;
endmodule
