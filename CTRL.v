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
// CREATED		"Wed Aug 16 09:57:21 2023"

module CTRL(
	reset,
	clk,
	Funct,
	Op,
	RegDst,
	RegWrite,
	ALUSrcA,
	IRWrite,
	MemWrite,
	IorD,
	PCWriteCond,
	PCWrite,
	isBNE,
	LOWrite,
	ALUOp,
	ALUSrcB,
	MemToReg,
	PCSrc,
	state
);


input wire	reset;
input wire	clk;
input wire	[5:0] Funct;
input wire	[31:26] Op;
output wire	RegDst;
output wire	RegWrite;
output wire	ALUSrcA;
output wire	IRWrite;
output wire	MemWrite;
output wire	IorD;
output wire	PCWriteCond;
output wire	PCWrite;
output wire	isBNE;
output wire	LOWrite;
output wire	[1:0] ALUOp;
output wire	[1:0] ALUSrcB;
output wire	[1:0] MemToReg;
output wire	[1:0] PCSrc;
output wire	[4:0] state;

wire	[1:0] ALUOp_ALTERA_SYNTHESIZED;
wire	[1:0] ALUSrcB_ALTERA_SYNTHESIZED;
wire	[1:0] MemToReg_ALTERA_SYNTHESIZED;
wire	[17:0] microinstruction;
wire	[1:0] PCSrc_ALTERA_SYNTHESIZED;
wire	[4:0] SYNTHESIZED_WIRE_0;

assign	state = SYNTHESIZED_WIRE_0;




MicroROM	b2v_inst(
	.state(SYNTHESIZED_WIRE_0),
	.microinstruction(microinstruction));


FSM	b2v_inst1(
	.clk(clk),
	.reset(reset),
	.Funct(Funct),
	.Op(Op),
	.NS(SYNTHESIZED_WIRE_0));


SameBit	b2v_sameBitUnit02(
	.Ain(microinstruction[2]),
	.Aout(RegDst));


SameBit	b2v_sameBitUnit03(
	.Ain(microinstruction[3]),
	.Aout(RegWrite));


SameBit	b2v_sameBitUnit04(
	.Ain(microinstruction[4]),
	.Aout(ALUSrcA));


SameBit	b2v_sameBitUnit05(
	.Ain(microinstruction[5]),
	.Aout(ALUSrcB_ALTERA_SYNTHESIZED[0]));


SameBit	b2v_sameBitUnit06(
	.Ain(microinstruction[6]),
	.Aout(ALUSrcB_ALTERA_SYNTHESIZED[1]));


SameBit	b2v_sameBitUnit07(
	.Ain(microinstruction[7]),
	.Aout(ALUOp_ALTERA_SYNTHESIZED[0]));


SameBit	b2v_sameBitUnit08(
	.Ain(microinstruction[8]),
	.Aout(ALUOp_ALTERA_SYNTHESIZED[1]));


SameBit	b2v_sameBitUnit09(
	.Ain(microinstruction[9]),
	.Aout(PCSrc_ALTERA_SYNTHESIZED[0]));


SameBit	b2v_sameBitUnit10(
	.Ain(microinstruction[10]),
	.Aout(PCSrc_ALTERA_SYNTHESIZED[1]));


SameBit	b2v_sameBitUnit11(
	.Ain(microinstruction[11]),
	.Aout(MemToReg_ALTERA_SYNTHESIZED[0]));


SameBit	b2v_sameBitUnit12(
	.Ain(microinstruction[13]),
	.Aout(IRWrite));


SameBit	b2v_sameBitUnit13(
	.Ain(microinstruction[14]),
	.Aout(MemWrite));


SameBit	b2v_sameBitUnit14(
	.Ain(microinstruction[15]),
	.Aout(IorD));


SameBit	b2v_sameBitUnit15(
	.Ain(microinstruction[16]),
	.Aout(PCWriteCond));


SameBit	b2v_sameBitUnit16(
	.Ain(microinstruction[17]),
	.Aout(PCWrite));


SameBit	b2v_sameBitUnit17(
	.Ain(microinstruction[12]),
	.Aout(MemToReg_ALTERA_SYNTHESIZED[1]));


SameBit	b2v_sameBitUnit2(
	.Ain(microinstruction[1]),
	.Aout(isBNE));


SameBit	b2v_sameBitUnit4(
	.Ain(microinstruction[0]),
	.Aout(LOWrite));

assign	ALUOp = ALUOp_ALTERA_SYNTHESIZED;
assign	ALUSrcB = ALUSrcB_ALTERA_SYNTHESIZED;
assign	MemToReg = MemToReg_ALTERA_SYNTHESIZED;
assign	PCSrc = PCSrc_ALTERA_SYNTHESIZED;

endmodule
