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
// CREATED		"Tue Feb  2 07:48:31 2021"

module FSM(
	clk,
	reset,
	addrctl,
	Op,
	NS
);


input wire	clk;
input wire	reset;
input wire	addrctl;
input wire	[5:0] Op;
output wire	[3:0] NS;

wire	FSM_NS0;
wire	FSM_NS1;
wire	FSM_NS2;
wire	FSM_NS3;
wire	notRESET;
wire	NS0beforeFF;
wire	NS0MUXout;
wire	NS1beforeFF;
wire	NS1MUXout;
wire	NS2beforeFF;
wire	NS2MUXout;
wire	NS3beforeFF;
wire	NS3MUXout;
reg	[3:0] NS_ALTERA_SYNTHESIZED;
wire	Power;
wire	Splusone0;
wire	Splusone1;
wire	Splusone2;
wire	Splusone3;





INC4	b2v_addOne(
	.A3(NS_ALTERA_SYNTHESIZED[3]),
	.A2(NS_ALTERA_SYNTHESIZED[2]),
	.A1(NS_ALTERA_SYNTHESIZED[1]),
	.A0(NS_ALTERA_SYNTHESIZED[0]),
	.S3(Splusone3),
	.S2(Splusone2),
	.S1(Splusone1),
	.S0(Splusone0));

assign	notRESET =  ~reset;



always@(posedge clk or negedge Power or negedge Power)
begin
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[3] <= 0;
	end
else
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[3] <= 1;
	end
else
	begin
	NS_ALTERA_SYNTHESIZED[3] <= NS3beforeFF;
	end
end


always@(posedge clk or negedge Power or negedge Power)
begin
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[0] <= 0;
	end
else
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[0] <= 1;
	end
else
	begin
	NS_ALTERA_SYNTHESIZED[0] <= NS0beforeFF;
	end
end


always@(posedge clk or negedge Power or negedge Power)
begin
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[2] <= 0;
	end
else
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[2] <= 1;
	end
else
	begin
	NS_ALTERA_SYNTHESIZED[2] <= NS2beforeFF;
	end
end


always@(posedge clk or negedge Power or negedge Power)
begin
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[1] <= 0;
	end
else
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[1] <= 1;
	end
else
	begin
	NS_ALTERA_SYNTHESIZED[1] <= NS1beforeFF;
	end
end

assign	NS3beforeFF = notRESET & NS3MUXout;

assign	NS2beforeFF = notRESET & NS2MUXout;

assign	NS1beforeFF = notRESET & NS1MUXout;

assign	NS0beforeFF = notRESET & NS0MUXout;


NS0	b2v_myNS0(
	.Op5(Op[5]),
	.Op4(Op[4]),
	.Op3(Op[3]),
	.Op2(Op[2]),
	.Op1(Op[1]),
	.Op0(Op[0]),
	.S3(NS_ALTERA_SYNTHESIZED[3]),
	.S2(NS_ALTERA_SYNTHESIZED[2]),
	.S1(NS_ALTERA_SYNTHESIZED[1]),
	.S0(NS_ALTERA_SYNTHESIZED[0]),
	.NS0(FSM_NS0));


NS1	b2v_myNS1(
	.Op5(Op[5]),
	.Op4(Op[4]),
	.Op3(Op[3]),
	.Op2(Op[2]),
	.Op1(Op[1]),
	.Op0(Op[0]),
	.S3(NS_ALTERA_SYNTHESIZED[3]),
	.S2(NS_ALTERA_SYNTHESIZED[2]),
	.S1(NS_ALTERA_SYNTHESIZED[1]),
	.S0(NS_ALTERA_SYNTHESIZED[0]),
	.NS1(FSM_NS1));


NS2	b2v_myNS2(
	.Op5(Op[5]),
	.Op4(Op[4]),
	.Op3(Op[3]),
	.Op2(Op[2]),
	.Op1(Op[1]),
	.Op0(Op[0]),
	.S3(NS_ALTERA_SYNTHESIZED[3]),
	.S2(NS_ALTERA_SYNTHESIZED[2]),
	.S1(NS_ALTERA_SYNTHESIZED[1]),
	.S0(NS_ALTERA_SYNTHESIZED[0]),
	.NS2(FSM_NS2));


NS3	b2v_myNS3(
	.Op5(Op[5]),
	.Op4(Op[4]),
	.Op3(Op[3]),
	.Op2(Op[2]),
	.Op1(Op[1]),
	.Op0(Op[0]),
	.S3(NS_ALTERA_SYNTHESIZED[3]),
	.S2(NS_ALTERA_SYNTHESIZED[2]),
	.S1(NS_ALTERA_SYNTHESIZED[1]),
	.S0(NS_ALTERA_SYNTHESIZED[0]),
	.NS3(FSM_NS3));


MUX2	b2v_NS0MUX(
	.S(addrctl),
	.A(FSM_NS0),
	.B(Splusone0),
	.Y(NS0MUXout));


MUX2	b2v_NS1MUX(
	.S(addrctl),
	.A(FSM_NS1),
	.B(Splusone1),
	.Y(NS1MUXout));


MUX2	b2v_NS2MUX(
	.S(addrctl),
	.A(FSM_NS2),
	.B(Splusone2),
	.Y(NS2MUXout));


MUX2	b2v_NS3MUX(
	.S(addrctl),
	.A(FSM_NS3),
	.B(Splusone3),
	.Y(NS3MUXout));

assign	NS = NS_ALTERA_SYNTHESIZED;
assign	Power = 1;

endmodule
