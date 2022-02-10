// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
// CREATED		"Thu Feb 10 12:23:03 2022"

module NS2(
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
	NS2
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
output wire	NS2;

wire	NOTOp0;
wire	NOTOp1;
wire	NOTOp2;
wire	NOTOp3;
wire	NOTOp4;
wire	NOTOp5;
wire	NOTOp5NOTOp4NOTOp3Op2NOTOp1Op0;
wire	NOTS0;
wire	NOTS1;
wire	NOTS2;
wire	NOTS3;
wire	NOTs3NOTs2NOTs1s0;
wire	NOTs3NOTs2NOTs1s0NOTOp5NOTOp4NOTOp3Op2NOTOp1Op0;
wire	RTYPE;
wire	RTYPE_AND_STATE1;
wire	STATE1;
wire	STATE5;
wire	SW;
wire	SW_AND_STATE2;
wire	SYNTHESIZED_WIRE_0;




assign	NOTOp5 =  ~Op5;

assign	NOTOp4 =  ~Op4;

assign	RTYPE = NOTOp3 & NOTOp5 & NOTOp4 & NOTOp2 & NOTOp1 & NOTOp0;

assign	SW = Op3 & Op5 & NOTOp4 & NOTOp2 & Op1 & Op0;

assign	STATE1 = NOTS3 & NOTS2 & NOTS1 & S0;

assign	STATE5 = NOTS3 & NOTS2 & S1 & NOTS0;

assign	RTYPE_AND_STATE1 = RTYPE & STATE1;

assign	SW_AND_STATE2 = SW & STATE5;

assign	SYNTHESIZED_WIRE_0 = SW_AND_STATE2 | RTYPE_AND_STATE1;

assign	NOTs3NOTs2NOTs1s0 = S0 & NOTS1 & NOTS2 & NOTS3;

assign	NOTOp5NOTOp4NOTOp3Op2NOTOp1Op0 = NOTOp3 & NOTOp5 & NOTOp4 & Op2 & NOTOp1 & Op0;

assign	NOTs3NOTs2NOTs1s0NOTOp5NOTOp4NOTOp3Op2NOTOp1Op0 = NOTOp5NOTOp4NOTOp3Op2NOTOp1Op0 & NOTs3NOTs2NOTs1s0;

assign	NOTOp3 =  ~Op3;

assign	NS2 = SYNTHESIZED_WIRE_0 | NOTs3NOTs2NOTs1s0NOTOp5NOTOp4NOTOp3Op2NOTOp1Op0;

assign	NOTOp2 =  ~Op2;

assign	NOTOp1 =  ~Op1;

assign	NOTOp0 =  ~Op0;

assign	NOTS3 =  ~S3;

assign	NOTS2 =  ~S2;

assign	NOTS1 =  ~S1;

assign	NOTS0 =  ~S0;


endmodule
