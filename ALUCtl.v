// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Wed Aug 16 09:57:12 2023"

module ALUCtl(
	ALUOp,
	F,
	ALUControl
);


input wire	[1:0] ALUOp;
input wire	[5:0] F;
output wire	[6:0] ALUControl;

wire	[6:0] ALUControl_ALTERA_SYNTHESIZED;
wire	NOT_MULT;
wire	SLT_OR_OR;
wire	SLT_or_SUB;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_7;




assign	SYNTHESIZED_WIRE_3 = F[0] | F[3];

assign	ALUControl_ALTERA_SYNTHESIZED[1] = ALUOp[0] | SYNTHESIZED_WIRE_0 | SYNTHESIZED_WIRE_1;

assign	NOT_MULT =  ~SYNTHESIZED_WIRE_8;

assign	SLT_OR_OR = SYNTHESIZED_WIRE_3 & NOT_MULT;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_4 & NOT_MULT;

assign	ALUControl_ALTERA_SYNTHESIZED[6] = ALUOp[1] & SYNTHESIZED_WIRE_5;

assign	ALUControl_ALTERA_SYNTHESIZED[2] = ALUOp[1] & SYNTHESIZED_WIRE_8;

assign	ALUControl_ALTERA_SYNTHESIZED[0] = ALUOp[1] & SYNTHESIZED_WIRE_7;

assign	SYNTHESIZED_WIRE_1 =  ~ALUOp[1];

assign	SLT_or_SUB = F[1] & ALUOp[1];

assign	ALUControl_ALTERA_SYNTHESIZED[3] = SLT_or_SUB | ALUOp[0];

assign	SYNTHESIZED_WIRE_4 =  ~F[2];

assign	SYNTHESIZED_WIRE_8 = F[3] & F[4];

assign	SYNTHESIZED_WIRE_7 = ALUOp[0] | SLT_OR_OR;

assign	SYNTHESIZED_WIRE_5 = ~(F[5] | F[3] | F[4] | F[2] | F[0] | F[1]);



SameBit	b2v_sameBitUnit(
	.Ain(ALUControl_ALTERA_SYNTHESIZED[3]),
	.Aout(ALUControl_ALTERA_SYNTHESIZED[4]));

assign	ALUControl = ALUControl_ALTERA_SYNTHESIZED;
assign	ALUControl_ALTERA_SYNTHESIZED[5] = 0;

endmodule
