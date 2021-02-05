// Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 15.0.0 Build 145 04/22/2015 SJ Web Edition"
// CREATED		"Tue Feb  2 07:49:42 2021"

module ALUCtl(
	ALUOp,
	F,
	ALUControl
);


input wire	[1:0] ALUOp;
input wire	[5:0] F;
output wire	[4:0] ALUControl;

wire	[4:0] ALUControl_ALTERA_SYNTHESIZED;
wire	SLT_or_OR;
wire	SLT_or_SUB;




assign	SLT_or_OR = F[0] | F[3];

assign	ALUControl_ALTERA_SYNTHESIZED[0] = ALUOp[1] & SLT_or_OR;

assign	SLT_or_SUB = F[1] & ALUOp[1];

assign	ALUControl_ALTERA_SYNTHESIZED[2] = SLT_or_SUB | ALUOp[0];


assign	ALUControl_ALTERA_SYNTHESIZED[1] = ~(ALUOp[1] & F[2]);


SameBit	b2v_sameBitUnit(
	.Ain(ALUControl_ALTERA_SYNTHESIZED[2]),
	.Aout(ALUControl_ALTERA_SYNTHESIZED[3]));

assign	ALUControl = ALUControl_ALTERA_SYNTHESIZED;
assign	ALUControl_ALTERA_SYNTHESIZED[4] = 0;

endmodule
