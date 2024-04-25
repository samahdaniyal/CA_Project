`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2024 04:38:23 PM
// Design Name: 
// Module Name: TB_Pipelined_Processor
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


module TB_Pipelined_Processor();
  reg clk, reset;
  wire [63:0] first_num;
  wire [63:0] second_num;
  wire [63:0] third_num;
  wire [63:0] fourth_num;
  wire [63:0] fifth_num;
  wire stall;
  wire flush;
  
  RISC_V_processor r1
  (
    .clk(clk),
    .reset(reset),
    .output0(first_num),
    .output1(second_num),
    .output2(third_num),
    .output3(fourth_num),
    .output4(fifth_num),
    .stall(stall),
    .flush(flush)
  );
  
  initial 
    begin
		
      clk = 1'b0;
      reset = 1'b1;
      
      #7 
      reset = 1'b0;

      
    end
  
  always
    begin
      #5
      clk = ~clk;
    end
endmodule
