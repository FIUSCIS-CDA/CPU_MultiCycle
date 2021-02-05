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
// CREATED		"Tue Feb  2 07:48:55 2021"

module NS1(
	Op5,
	Op4,
	Op3,
	Op2,
	Op1,
	Op0,
	S3,
	S2,
	S1,
	S0,
	NS1
);


input wire	Op5;
input wire	Op4;
input wire	Op3;
input wire	Op2;
input wire	Op1;
input wire	Op0;
input wire	S3;
input wire	S2;
input wire	S1;
input wire	S0;
output wire	NS1;

wire	ADDI;
wire	ADDI_or_LW_or_SW_or_RTYPE;
wire	LW;
wire	LW_AND_STATE2;
wire	NOTOp0;
wire	NOTOp1;
wire	NOTOp2;
wire	NOTOp3;
wire	NOTOp4;
wire	NOTOp5;
wire	NOTS0;
wire	NOTS1;
wire	NOTS2;
wire	NOTS3;
wire	RTYPE;
wire	STATE1;
wire	STATE1_AND___ADDI_OR_LW_OR_SW_OR_RTYPE___;
wire	STATE2;
wire	SW;




assign	NOTOp5 =  ~Op5;

assign	NOTOp4 =  ~Op4;

assign	NOTOp3 =  ~Op3;

assign	NS1 = LW_AND_STATE2 | STATE1_AND___ADDI_OR_LW_OR_SW_OR_RTYPE___;

assign	ADDI = Op3 & NOTOp5 & NOTOp4 & NOTOp2 & NOTOp1 & NOTOp0;

assign	STATE1 = NOTS3 & NOTS2 & NOTS1 & S0;

assign	STATE1_AND___ADDI_OR_LW_OR_SW_OR_RTYPE___ = STATE1 & ADDI_or_LW_or_SW_or_RTYPE;

assign	ADDI_or_LW_or_SW_or_RTYPE = ADDI | SW | RTYPE | LW;

assign	NOTOp2 =  ~Op2;

assign	LW = NOTOp3 & Op5 & NOTOp4 & NOTOp2 & Op1 & Op0;

assign	SW = Op3 & Op5 & NOTOp4 & NOTOp2 & Op1 & Op0;

assign	RTYPE = NOTOp3 & NOTOp5 & NOTOp4 & NOTOp2 & NOTOp1 & NOTOp0;

assign	LW_AND_STATE2 = LW & STATE2;

assign	STATE2 = NOTS3 & S1 & NOTS0 & NOTS2;

assign	NOTOp1 =  ~Op1;

assign	NOTOp0 =  ~Op0;

assign	NOTS3 =  ~S3;

assign	NOTS2 =  ~S2;

assign	NOTS1 =  ~S1;

assign	NOTS0 =  ~S0;


endmodule
