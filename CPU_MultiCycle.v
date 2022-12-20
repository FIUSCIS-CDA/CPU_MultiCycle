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
// CREATED		"Tue Dec 20 13:55:20 2022"

module CPU_MultiCycle(
	clk,
	reset,
	_PC,
	OPCODE,
	state
);


input wire	clk;
input wire	reset;
output wire	[31:0] _PC;
output wire	[31:26] OPCODE;
output wire	[3:0] state;

wire	[31:0] A;
wire	[31:0] Adr;
wire	[4:0] ALUControl;
wire	[1:0] ALUOp;
wire	[31:0] ALUOut;
wire	ALUSrcA;
wire	[1:0] ALUSrcB;
wire	[31:0] B;
wire	[31:0] Data;
wire	[31:0] ImmExt;
wire	[31:0] ImmExt_times_4;
wire	[31:0] Instr;
wire	[31:0] InstY;
wire	IorD;
wire	IRWrite;
wire	MemToReg;
wire	MemWrite;
wire	[3:0] myState;
wire	notEqual;
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
wire	[31:0] Res;
wire	[31:0] SrcA;
wire	[31:0] SrcB;
wire	wire_to_ground;
wire	[31:0] WriteData;
wire	[4:0] WriteRegister;
wire	[31:0] Y;
wire	Zero;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;





Flopr_32	b2v_ALURESREG(
	.reset(reset),
	.clk(clk),
	.D(InstY),
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


CTRL	b2v_CTRL_UNIT(
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
	.isBNE(SYNTHESIZED_WIRE_2),
	.ALUOp(ALUOp),
	.ALUSrcB(ALUSrcB),
	.PCSrc(PCSrc),
	.state(myState));


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


Grounder	b2v_inst(
	.Input_To_Ground(wire_to_ground));


ALU_32	b2v_inst1(
	.A(SrcA),
	.alu_op(ALUControl),
	.B(SrcB),
	.Overflow(wire_to_ground),
	.Zero(Zero),
	.Result(Res));

assign	PCEn = PCWriteCond_and_Zero | PCWrite;

assign	SYNTHESIZED_WIRE_14 =  ~Instr[26];

assign	SYNTHESIZED_WIRE_10 =  ~Instr[27];

assign	SYNTHESIZED_WIRE_7 =  ~Instr[28];

assign	SYNTHESIZED_WIRE_8 =  ~Instr[30];

assign	SYNTHESIZED_WIRE_9 =  ~Instr[29];

assign	SYNTHESIZED_WIRE_4 =  ~Instr[31];

assign	SYNTHESIZED_WIRE_3 =  ~Instr[5];

assign	SYNTHESIZED_WIRE_13 =  ~Instr[3];


SLL_32	b2v_inst2(
	.A(ReadData2),
	.H(Instr[10:6]),
	.Y(Y));

assign	SYNTHESIZED_WIRE_5 =  ~Instr[1];

assign	SYNTHESIZED_WIRE_12 =  ~Instr[4];

assign	SYNTHESIZED_WIRE_6 =  ~Instr[2];

assign	SYNTHESIZED_WIRE_11 =  ~Instr[0];


MUX2_32	b2v_inst24(
	.S(SYNTHESIZED_WIRE_1),
	.A(Res),
	.B(Y),
	.Y(InstY));


SL2_32	b2v_inst3(
	.A(ImmExt),
	.Y(ImmExt_times_4));


MUX2	b2v_inst4(
	.S(SYNTHESIZED_WIRE_2),
	.A(Zero),
	.B(notEqual),
	.Y(SYNTHESIZED_WIRE_16));

assign	notEqual =  ~Zero;

assign	SYNTHESIZED_WIRE_15 = SYNTHESIZED_WIRE_3 & SYNTHESIZED_WIRE_4 & SYNTHESIZED_WIRE_5 & SYNTHESIZED_WIRE_6 & SYNTHESIZED_WIRE_7 & SYNTHESIZED_WIRE_8 & SYNTHESIZED_WIRE_9 & SYNTHESIZED_WIRE_10 & SYNTHESIZED_WIRE_11 & SYNTHESIZED_WIRE_12 & SYNTHESIZED_WIRE_13 & SYNTHESIZED_WIRE_14;

assign	SYNTHESIZED_WIRE_1 = SYNTHESIZED_WIRE_15 & ALUSrcA;

assign	PCWriteCond_and_Zero = PCWriteCond & SYNTHESIZED_WIRE_16;


Flopenr_32	b2v_IR(
	.reset(reset),
	.clk(clk),
	.E(IRWrite),
	.D(ReadDat),
	.Q(Instr));


ALUCtl	b2v_myALUCtl(
	.ALUOp(ALUOp),
	.F(Instr[5:0]),
	.ALUControl(ALUControl));


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
	.A(InstY),
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

assign	_PC = PC;
assign	OPCODE[31:26] = Instr[31:26];
assign	state = myState;

endmodule
