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
// CREATED		"Tue Feb  2 07:48:19 2021"

module CPU_MultiCycle(
	clk,
	reset,
	Overflow
);


input wire	clk;
input wire	reset;
output wire	Overflow;

wire	[31:0] A;
wire	[31:0] Adr;
wire	[4:0] ALUControl;
wire	[1:0] ALUOp;
wire	[31:0] ALUOut;
wire	[31:0] ALUResult;
wire	ALUSrcA;
wire	[1:0] ALUSrcB;
wire	[31:0] B;
wire	[31:0] Data;
wire	[31:0] ImmExt;
wire	[31:0] ImmExt_times_4;
wire	[31:0] Instr;
wire	IorD;
wire	IRWrite;
wire	MemToReg;
wire	MemWrite;
wire	[31:0] PC;
wire	PCEn;
wire	[31:0] PCJump;
wire	[31:0] PCPrime;
wire	[1:0] PCSrc;
wire	PCWrite;
wire	PCWriteCond;
wire	PCWriteCond_and_Zero;
wire	[31:0] ReadDat;
wire	[31:0] ReadData1;
wire	[31:0] ReadData2;
wire	RegDst;
wire	RegWrite;
wire	[31:0] SrcA;
wire	[31:0] SrcB;
wire	[31:0] WriteData;
wire	[4:0] WriteRegister;
wire	Zero;
wire	[31:0] SYNTHESIZED_WIRE_0;





Flopr_32	b2v_ALURESREG(
	.reset(reset),
	.clk(clk),
	.D(ALUResult),
	.Q(ALUOut));


MUX2_32	b2v_AMUX(
	.S(ALUSrcA),
	.A(PC),
	.B(A),
	.Y(SrcA));


MUX4_32	b2v_BMUX(
	.A(B),
	.B(SYNTHESIZED_WIRE_0),
	.C(ImmExt),
	.D(ImmExt_times_4),
	.S(ALUSrcB),
	.Y(SrcB));


SL2_32	b2v_CONSTANTSL2(
	.I(ImmExt),
	.O(ImmExt_times_4));


Flopr_32	b2v_DR(
	.reset(reset),
	.clk(clk),
	.D(ReadDat),
	.Q(Data));


DM_asynch	b2v_IDM(
	.we(MemWrite),
	.a(Adr),
	.wd(SrcB),
	.rd(ReadDat));

assign	PCEn = PCWriteCond_and_Zero | PCWrite;

assign	PCWriteCond_and_Zero = PCWriteCond & Zero;


Flopenr_32	b2v_IR(
	.reset(reset),
	.clk(clk),
	.E(IRWrite),
	.D(ReadDat),
	.Q(Instr));


ALU32	b2v_MYALU(
	.A(SrcA),
	.alu_op(ALUControl),
	.B(SrcB),
	.Overflow(Overflow),
	.eq(Zero),
	.Result(ALUResult));


ALUCtl	b2v_myALUCtl(
	.ALUOp(ALUOp),
	.F(Instr[5:0]),
	.ALUControl(ALUControl));


CTRL	b2v_myCTRL(
	.clk(clk),
	.reset(reset),
	.Op(Instr[31:26]),
	.PCWrite(PCWrite),
	.PCWriteCond(PCWriteCond),
	.IorD(IorD),
	.MemWrite(MemWrite),
	.IRWrite(IRWrite),
	.MemToReg(MemToReg),
	.ALUSrcA(ALUSrcA),
	.RegWrite(RegWrite),
	.RegDst(RegDst),
	.ALUOp(ALUOp),
	.ALUSrcB(ALUSrcB),
	.PCSrc(PCSrc));


RF	b2v_myRF(
	.reset(reset),
	.clk(clk),
	.we(RegWrite),
	.r1a(Instr[25:21]),
	.r2a(Instr[20:16]),
	.wa(WriteRegister),
	.wd(WriteData),
	.r1d(ReadData1),
	.r2d(ReadData2));


Four	b2v_number4(
	.Y(SYNTHESIZED_WIRE_0));


MUX2_32	b2v_PCMUX(
	.S(IorD),
	.A(PC),
	.B(ALUOut),
	.Y(Adr));


Flopenr_32	b2v_PCR(
	.reset(reset),
	.clk(clk),
	.E(PCEn),
	.D(PCPrime),
	.Q(PC));


Flopr_32	b2v_R1DR(
	.reset(reset),
	.clk(clk),
	.D(ReadData1),
	.Q(A));


Flopr_32	b2v_R2DR(
	.reset(reset),
	.clk(clk),
	.D(ReadData2),
	.Q(B));


MUX3_32	b2v_rightMUX(
	.A(ALUResult),
	.B(ALUOut),
	.C(PCJump),
	.S(PCSrc),
	.Y(PCPrime));


SE16_32	b2v_SECONSTANT(
	.A(Instr[15:0]),
	.Y(ImmExt));


SPLICE_PCJ	b2v_spliceUnit(
	.ir25_0(Instr[25:0]),
	.pc31_28(PC[31:28]),
	.Y(PCJump));


MUX2_5	b2v_WAMUX(
	.S(RegDst),
	.A(Instr[20:16]),
	.B(Instr[15:11]),
	.Y(WriteRegister));


MUX2_32	b2v_WDMUX(
	.S(MemToReg),
	.A(ALUOut),
	.B(Data),
	.Y(WriteData));


endmodule
