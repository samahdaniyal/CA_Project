`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 10:36:29 AM
// Design Name: 
// Module Name: MUX_2x1
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


module MUX_2x1(
    input [63:0] A,
    input [63:0] B,
    input S,
    output [63:0] Out
);
    assign Out = (S == 1'b0) ? A : B;
endmodule
