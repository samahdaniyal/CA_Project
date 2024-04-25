`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2024 01:16:43 AM
// Design Name: 
// Module Name: pipleined_tb
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


module pipleined_tb();                
                      
    reg clk, reset;       
    wire [4:0] rd_out, rs1_out, rs2_out; 
    wire [63:0] ReadData1_out, ReadData2_out, IDEX_ReadData1_out, IDEX_ReadData2_out; 
    wire [4:0] IDEX_rd_out; 
    wire [63:0] EXMEM_ReadData2_out; 
    wire [4:0] EXMEM_rd_out;
    wire [63:0] MEMWB_DM_Read_Data_out;
    wire [4:0] MEMWB_rd_out;

                      
hazard_processor riscv
(                     
    clk, reset, rd_out, rs1_out, rs2_out, ReadData1_out, ReadData2_out, IDEX_ReadData1_out, IDEX_ReadData2_out, IDEX_rd_out,
    EXMEM_ReadData2_out, EXMEM_rd_out, MEMWB_DM_Read_Data_out, MEMWB_rd_out
);                    
                      
initial               
                      
 begin                
                      
  clk = 1'b0;         
                      
  reset = 1'b1;       
                      
  #10 reset = 1'b0;   
 end                  
                      
                      
always                
                      
 #5 clk = ~clk;       
                      
endmodule
