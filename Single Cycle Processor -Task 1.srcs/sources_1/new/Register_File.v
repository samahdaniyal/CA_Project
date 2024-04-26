`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 10:40:12 AM
// Design Name: 
// Module Name: Register_File
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


module Register_File(
    input clk,
    input reset,
    input [63:0] WriteData,
    input [4:0] RS1,
    input [4:0] RS2,
    input [4:0] RD,
    input RegWrite,
    output reg [63:0] ReadData1,
    output reg [63:0] ReadData2
    );
    
    reg[63:0] Registers [31:0];    //initialize Registers with random values (using 'initial' block)
    integer i;
      initial
        begin
          for (i=0; i<31; i=i+1)
            begin
              Registers[i] = 0;
            end
        end
     //operation of writing data into a Register should always be done when  
     //positive edge of clock and RegWrite signal is asserted (or set, i.e. High)  
      always @ (posedge clk) 
        begin   
          case(RegWrite)                             
            1'b1: Registers[RD] <= WriteData;   
          endcase  
        end 
     
      always @ (*)  
        begin   
          if(reset)  
            begin    
              ReadData1 = 64'b0;    
              ReadData2 = 64'b0;   
            end   
          else   
            begin    
              ReadData1 = Registers[RS1];    
              ReadData2 = Registers[RS2];   
            end  
        end  
endmodule
