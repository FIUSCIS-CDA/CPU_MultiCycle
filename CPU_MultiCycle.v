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
// CREATED		"Tue Jan 02 18:16:18 2024"

module CPU_MultiCycle(
	clk,
	reset,
	Overflow,
	_PC,
	FUNCTCODE,
	OPCODE,
	state
);


input wire	clk;
input wire	reset;
output wire	Overflow;
output wire	[31:0] _PC;
output wire	[31:26] FUNCTCODE;
output wire	[31:26] OPCODE;
output wire	[4:0] state;

wire	[31:0] A;
wire	[31:0] Adr;
wire	[1:0] ALUOp;
wire	[31:0] ALUOut;
wire	ALUSrcA;
wire	[1:0] ALUSrcB;
wire	ANDout;
wire	[31:0] B;
wire	[31:0] Data;
wire	[31:0] ImmExt;
wire	[31:0] ImmExt_times_4;
wire	IorD;
wire	[31:0] IR;
wire	IRWrite;
wire	isBNE;
wire	isZero;
wire	[31:0] LO_Q;
wire	LOwrite;
wire	[1:0] MemToReg;
wire	MemWrite;
wire	[4:0] myState;
wire	nEq;
wire	OV;
wire	[31:0] PC;
wire	PCEn;
wire	[31:0] PCJump;
wire	[31:0] PCPrime;
wire	[1:0] PCSrc;
wire	PCWrite;
wire	PCWriteCond;
wire	[31:0] RD1;
wire	[31:0] RD2;
wire	[31:0] RData;
wire	RegDst;
wire	RegWrite;
wire	[31:0] SrcA;
wire	[31:0] SrcB;
wire	[4:0] WA;
wire	[31:0] WD;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[6:0] SYNTHESIZED_WIRE_3;





Flopr_32	b2v_ALURESREG(
	.reset(reset),
	.clk(clk),
	.D(SYNTHESIZED_WIRE_5),
	.Q(ALUOut));


MUX2_32	b2v_AMUX(
	.S(ALUSrcA),
	.A(PC),
	.B(A),
	.Y(SrcA));


MUX2	b2v_ANDMUX(
	.S(isBNE),
	.A(isZero),
	.B(nEq),
	.Y(SYNTHESIZED_WIRE_2));


MUX4_32	b2v_BMUX(
	.A(B),
	.B(SYNTHESIZED_WIRE_1),
	.C(ImmExt),
	.D(ImmExt_times_4),
	.S(ALUSrcB),
	.Y(SrcB));


Flopr_32	b2v_DREG(
	.reset(reset),
	.clk(clk),
	.D(RData),
	.Q(Data));


DM_asynch	b2v_IDM(
	.we(MemWrite),
	.a(Adr),
	.wd(SrcB),
	.rd(RData));


CTRL	b2v_inst(
	.clk(clk),
	.reset(reset),
	.Funct(IR[5:0]),
	.Op(IR[31:26]),
	.MemWrite(MemWrite),
	.IorD(IorD),
	.PCWriteCond(PCWriteCond),
	.IRWrite(IRWrite),
	.ALUSrcA(ALUSrcA),
	.RegWrite(RegWrite),
	.RegDst(RegDst),
	.isBNE(isBNE),
	.LOWrite(LOwrite),
	.PCWrite(PCWrite),
	.ALUOp(ALUOp),
	.ALUSrcB(ALUSrcB),
	.MemToReg(MemToReg),
	.PCSrc(PCSrc),
	.state(myState));

assign	PCEn = ANDout | PCWrite;

assign	nEq =  ~isZero;

assign	ANDout = PCWriteCond & SYNTHESIZED_WIRE_2;


Flopenr_32	b2v_IREG(
	.reset(reset),
	.clk(clk),
	.E(IRWrite),
	.D(RData),
	.Q(IR));


Flopenr_32	b2v_LO(
	.reset(reset),
	.clk(clk),
	.E(LOwrite),
	.D(ALUOut),
	.Q(LO_Q));


ALU_32	b2v_MYALU(
	.A(SrcA),
	.alu_op(SYNTHESIZED_WIRE_3),
	.B(SrcB),
	.H(IR[10:6]),
	.Overflow(OV),
	.Zero(isZero),
	.Result(SYNTHESIZED_WIRE_5));


ALUCtl	b2v_myALUCtl(
	.ALUOp(ALUOp),
	.F(IR[5:0]),
	.ALUControl(SYNTHESIZED_WIRE_3));


RF	b2v_myRF(
	.reset(reset),
	.clk(clk),
	.we(RegWrite),
	.r1a(IR[25:21]),
	.r2a(IR[20:16]),
	.wa(WA),
	.wd(WD),
	.r1d(RD1),
	.r2d(RD2));


MUX3_32	b2v_NEXTPCMUX(
	.A(SYNTHESIZED_WIRE_5),
	.B(ALUOut),
	.C(PCJump),
	.S(PCSrc),
	.Y(PCPrime));


Four	b2v_number4(
	.Y(SYNTHESIZED_WIRE_1));


MUX2_32	b2v_PCMUX(
	.S(IorD),
	.A(PC),
	.B(ALUOut),
	.Y(Adr));


Flopenr_32	b2v_PCREG(
	.reset(reset),
	.clk(clk),
	.E(PCEn),
	.D(PCPrime),
	.Q(PC));


Flopr_32	b2v_R1DR(
	.reset(reset),
	.clk(clk),
	.D(RD1),
	.Q(A));


Flopr_32	b2v_R2DR(
	.reset(reset),
	.clk(clk),
	.D(RD2),
	.Q(B));


SE16_32	b2v_SECONSTANT(
	.A(IR[15:0]),
	.Y(ImmExt));


SL2_32	b2v_SLUNIT(
	.A(ImmExt),
	.Y(ImmExt_times_4));


SPLICE_PCJ	b2v_spliceUnit(
	.ir25_0(IR[25:0]),
	.pc31_28(PC[31:28]),
	.Y(PCJump));


MUX2_5	b2v_WAMUX(
	.S(RegDst),
	.A(IR[20:16]),
	.B(IR[15:11]),
	.Y(WA));


MUX3_32	b2v_WDMUX(
	.A(ALUOut),
	.B(Data),
	.C(LO_Q),
	.S(MemToReg),
	.Y(WD));

assign	Overflow = OV;
assign	_PC = PC;
assign	FUNCTCODE[31:26] = IR[5:0];
assign	OPCODE[31:26] = IR[31:26];
assign	state = myState;

endmodule
