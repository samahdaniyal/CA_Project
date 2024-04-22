`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 01:07:19 PM
// Design Name: 
// Module Name: RiscVPipelined_TB
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


module RiscVPipelined_TB();
    reg clk, reset;

    RISC_V_Pipelined riscv(clk, reset);
    
    initial begin
    clk = 1'b0; reset = 1'b0;
    #10 reset = 1'b1;
    #10 reset = 1'b0;
    end
    
    always
        #10 clk = ~clk;
endmodule
