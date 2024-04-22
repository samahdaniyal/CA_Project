`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 10:30:30 AM
// Design Name: 
// Module Name: Instruction_Memory
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


module Instruction_Memory(
input [63:0] Inst_Address,
	output reg [31:0] Instruction
);
	reg [7:0] inst_mem[175:0];
	initial
	begin
        inst_mem[0]=8'h13;
		inst_mem[1]=8'h05;
		inst_mem[2]=8'h00;
		inst_mem[3]=8'h00;
		//addi t0, x0, 3
		inst_mem[4]=8'h93;
		inst_mem[5]=8'h02;
		inst_mem[6]=8'h30;
		inst_mem[7]=8'h00;
		//sd t0, 0(a0) 
		inst_mem[8]=8'h23;
		inst_mem[9]=8'h30;
		inst_mem[10]=8'h55;
		inst_mem[11]=8'h00;
		//addi t0, x0, 2
		inst_mem[12]=8'h93;
		inst_mem[13]=8'h02;
		inst_mem[14]=8'h20;
		inst_mem[15]=8'h00;
		//sd t0, 8(a0)
		inst_mem[16]=8'h23;
		inst_mem[17]=8'h34;
		inst_mem[18]=8'h55;
		inst_mem[19]=8'h00;
		//addi t0, x0, 4
		inst_mem[20]=8'h93;
		inst_mem[21]=8'h02;
		inst_mem[22]=8'h40;
		inst_mem[23]=8'h00;
		//sd t0, 16(a0)
		inst_mem[24]=8'h23;
		inst_mem[25]=8'h38;
		inst_mem[26]=8'h55;
		inst_mem[27]=8'h00;
		//addi t0, x0, 1
		inst_mem[28]=8'h93;		
		inst_mem[29]=8'h02;
		inst_mem[30]=8'h10;
		inst_mem[31]=8'h00;
		//sd t0, 24(a0)
		inst_mem[32]=8'h23;
		inst_mem[33]=8'h3C;
		inst_mem[34]=8'h55;
		inst_mem[35]=8'h00;
		//addi t0, x0, 0
		inst_mem[36]=8'h93;
		inst_mem[37]=8'h02;
		inst_mem[38]=8'h00;
		inst_mem[39]=8'h00;
		//sd t0, 32(a0)
		inst_mem[40]=8'h23;
		inst_mem[41]=8'h30;
		inst_mem[42]=8'h55;
		inst_mem[43]=8'h02;
		
		// SIZE OF ARRAY
		inst_mem[44]=8'h93;
		inst_mem[45]=8'h05;
		inst_mem[46]=8'h50;
		inst_mem[47]=8'h00;
		
		// CALLING THE PROCEDURES USING BEQ
		inst_mem[48]=8'h63;
		inst_mem[49]=8'h04;
		inst_mem[50]=8'h00;
		inst_mem[51]=8'h00;
		
		inst_mem[52]=8'h63;
		inst_mem[53]=8'h08;
		inst_mem[54]=8'h00;
		inst_mem[55]=8'hA0;
		
		// SELECTION SORT
		inst_mem[56]=8'h93;
		inst_mem[57]=8'h02;
		inst_mem[58]=8'h00;
		inst_mem[59]=8'h00;
		
		inst_mem[60]=8'h13;
		inst_mem[61]=8'h03;
		inst_mem[62]=8'h00;
		inst_mem[63]=8'h00;
		
		inst_mem[64]=8'h93;
		inst_mem[65]=8'h03;
		inst_mem[66]=8'h00;
		inst_mem[67]=8'h00;
		
		inst_mem[68]=8'h13;
		inst_mem[69]=8'h84;
		inst_mem[70]=8'h05;
		inst_mem[71]=8'h00;
		
		inst_mem[72]=8'h93;
		inst_mem[73]=8'h85;
		inst_mem[74]=8'hF5;
		inst_mem[75]=8'hFF;
		
		// UNSORTED_ARRAY_BOUNDARY_LOOP
		inst_mem[76]=8'h63;
		inst_mem[77]=8'h80;
		inst_mem[78]=8'hb2;
		inst_mem[79]=8'h06;
		
		inst_mem[80]=8'h93;
		inst_mem[81]=8'h83;
		inst_mem[82]=8'h02;
		inst_mem[83]=8'h00;
		
		inst_mem[84]=8'h13;
		inst_mem[85]=8'h83;
		inst_mem[86]=8'h12;
		inst_mem[87]=8'h00;
		
		// SUBARRAY_LOOP
		inst_mem[88]=8'h63;
		inst_mem[89]=8'h06;
		inst_mem[90]=8'h83;
		inst_mem[91]=8'h02;
		
		inst_mem[92]=8'h13;
		inst_mem[93]=8'h1F;
		inst_mem[94]=8'h33;
		inst_mem[95]=8'h00;
		
		inst_mem[96]=8'hB3;
		inst_mem[97]=8'h0F;
		inst_mem[98]=8'hE5;
		inst_mem[99]=8'h01;
		
		inst_mem[100]=8'h83;
		inst_mem[101]=8'hBE;
		inst_mem[102]=8'h0F;
		inst_mem[103]=8'h00;
		
		inst_mem[104]=8'h13;
		inst_mem[105]=8'h9F;
		inst_mem[106]=8'h33;
		inst_mem[107]=8'h00;
		
		inst_mem[108]=8'hB3;
		inst_mem[109]=8'h0F;
		inst_mem[110]=8'hE5;
		inst_mem[111]=8'h01;
		
		inst_mem[112]=8'h03;
		inst_mem[113]=8'hBE;
		inst_mem[114]=8'h0f;
		inst_mem[115]=8'h00;
		
		inst_mem[116]=8'h63;
		inst_mem[117]=8'h44;
		inst_mem[118]=8'hDE;
		inst_mem[119]=8'h01;
		
		inst_mem[120]=8'h93;
		inst_mem[121]=8'h03;
		inst_mem[122]=8'h03;
		inst_mem[123]=8'h00;
		
		// MIN_REMAINS_SAME
		inst_mem[124]=8'h13;
		inst_mem[125]=8'h03;
		inst_mem[126]=8'h13;
		inst_mem[127]=8'h00;
		
		inst_mem[128]=8'he3;
		inst_mem[129]=8'h0c;
		inst_mem[130]=8'h00;
		inst_mem[131]=8'hFc;
		
		// END_SUBARRAY_LOOP
		inst_mem[132]=8'h13;
		inst_mem[133]=8'h9F;
		inst_mem[134]=8'h33;
		inst_mem[135]=8'h00;
		
		inst_mem[136]=8'hB3;
		inst_mem[137]=8'h0F;
		inst_mem[138]=8'hE5;
		inst_mem[139]=8'h01;
		
		inst_mem[140]=8'h03;
		inst_mem[141]=8'hBE;
		inst_mem[142]=8'h0F;
		inst_mem[143]=8'h00;
		
		inst_mem[144]=8'h13;
		inst_mem[145]=8'h93;
		inst_mem[146]=8'h32;
		inst_mem[147]=8'h00;
		
		inst_mem[148]=8'h33;
		inst_mem[149]=8'h03;
		inst_mem[150]=8'hA3;
		inst_mem[151]=8'h00;
		
		inst_mem[152]=8'h83;
		inst_mem[153]=8'h3E;
		inst_mem[154]=8'h03;
		inst_mem[155]=8'h00;
		
		inst_mem[156]=8'h23;
		inst_mem[157]=8'h30;
		inst_mem[158]=8'hc3;
		inst_mem[159]=8'h01;
		
		inst_mem[160]=8'h23;
		inst_mem[161]=8'hB0;
		inst_mem[162]=8'hdF;
		inst_mem[163]=8'h01;
		
		inst_mem[164]=8'h93;
		inst_mem[165]=8'h82;
		inst_mem[166]=8'h12;
		inst_mem[167]=8'h00;
		
		inst_mem[168]=8'he3;
		inst_mem[169]=8'h02;
		inst_mem[170]=8'h00;
		inst_mem[171]=8'hfa;
		
		// END UNSORTED ARRAY BOUNDARY LOOP
		inst_mem[172]=8'h63;
		inst_mem[173]=8'h00;
		inst_mem[174]=8'h00;
		inst_mem[175]=8'h00;
    end
	  
	always @(Inst_Address)
	begin
		Instruction<={inst_mem[Inst_Address+3],inst_mem[Inst_Address+2],inst_mem[Inst_Address+1],inst_mem[Inst_Address]};
	end
endmodule
//bubble sort: WORKS
//      {inst_mem[3], inst_mem[2], inst_mem[1], inst_mem[0]} = 32'h00000913;//1
//      {inst_mem[7], inst_mem[6], inst_mem[5], inst_mem[4]} = 32'h00500993;//2
//      {inst_mem[11], inst_mem[10], inst_mem[9], inst_mem[8]} = 32'h00000413;//3
//      {inst_mem[15], inst_mem[14], inst_mem[13], inst_mem[12]} = 32'h00050513;//4
//      {inst_mem[19], inst_mem[18], inst_mem[17], inst_mem[16]} = 32'h00500113;//5	
//      {inst_mem[23], inst_mem[22], inst_mem[21], inst_mem[20]} = 32'h00200193;//6
//      {inst_mem[27], inst_mem[26], inst_mem[25], inst_mem[24]} = 32'h00100213;//7
//      {inst_mem[31], inst_mem[30], inst_mem[29], inst_mem[28]} = 32'h00700593;//8
//      {inst_mem[35], inst_mem[34], inst_mem[33], inst_mem[32]} = 32'h00400613;//9
//      {inst_mem[39], inst_mem[38], inst_mem[37], inst_mem[36]} = 32'h07340663;//10	
//      {inst_mem[43], inst_mem[42], inst_mem[41], inst_mem[40]} = 32'h00000493;//11
//      {inst_mem[47], inst_mem[46], inst_mem[45], inst_mem[44]} = 32'h00000513;//12
//      {inst_mem[51], inst_mem[50], inst_mem[49], inst_mem[48]} = 32'hfff98313;//13
//      {inst_mem[55], inst_mem[54], inst_mem[53], inst_mem[52]} = 32'h40830333;//14
//      {inst_mem[59], inst_mem[58], inst_mem[57], inst_mem[56]} = 32'h04648663;//15
//      {inst_mem[63], inst_mem[62], inst_mem[61], inst_mem[60]} = 32'h00349393;//16
//      {inst_mem[67], inst_mem[66], inst_mem[65], inst_mem[64]} = 32'h012383b3;//17
//      {inst_mem[71], inst_mem[70], inst_mem[69], inst_mem[68]} = 32'h0003b283;//18
//      {inst_mem[75], inst_mem[74], inst_mem[73], inst_mem[72]} = 32'h00148e93;//19
//      {inst_mem[79], inst_mem[78], inst_mem[77], inst_mem[76]} = 32'h003e9e13;//20
//      {inst_mem[83], inst_mem[82], inst_mem[81], inst_mem[80]} = 32'h012e0e33;//21
//      {inst_mem[87], inst_mem[86], inst_mem[85], inst_mem[84]} = 32'h000e3f03;//22
//      {inst_mem[91], inst_mem[90], inst_mem[89], inst_mem[88]} = 32'h005f4663;//23
//      {inst_mem[95], inst_mem[94], inst_mem[93], inst_mem[92]} = 32'h00148493;//24
//      {inst_mem[99], inst_mem[98], inst_mem[97], inst_mem[96]} = 32'hfc000ce3;//25
//      {inst_mem[103], inst_mem[102], inst_mem[101], inst_mem[100]} = 32'h00028f93;//26
//      {inst_mem[107], inst_mem[106], inst_mem[105], inst_mem[104]} = 32'h000f0293;//27
//      {inst_mem[111], inst_mem[110], inst_mem[109], inst_mem[108]} = 32'h0053b023;//28
//      {inst_mem[115], inst_mem[114], inst_mem[113], inst_mem[112]} = 32'h000f8f13;//29
//      {inst_mem[119], inst_mem[118], inst_mem[117], inst_mem[116]} = 32'h01ee3023;//31
//      {inst_mem[123], inst_mem[122], inst_mem[121], inst_mem[120]} = 32'h00100513;//32
//      {inst_mem[127], inst_mem[126], inst_mem[125], inst_mem[124]} = 32'h00148493;//33
//      {inst_mem[131], inst_mem[130], inst_mem[129], inst_mem[128]} = 32'hfa000ce3;//34
//      {inst_mem[135], inst_mem[134], inst_mem[133], inst_mem[132]} = 32'h00140413;//35
//      {inst_mem[139], inst_mem[138], inst_mem[137], inst_mem[136]} = 32'h00050463;//36
//      {inst_mem[143], inst_mem[142], inst_mem[141], inst_mem[140]} = 32'hf8000ce3;//37