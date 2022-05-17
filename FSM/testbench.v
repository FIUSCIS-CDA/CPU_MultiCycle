///////////////////////////////////////////////////////////////////////////////////
// Testbench for Component: FSM (CLK=20)
// Package: FIUSCIS-CDA
// Course: CDA3102 (Computer Architecture), Florida International University
// Developer: Trevor Cickovski
// Extended By: CDA3102 students
// License: MIT, (C) 2020-2022 All Rights Reserved
///////////////////////////////////////////////////////////////////////////////////


module testbench();
`include "../../Test/Test.v"
///////////////////////////////////////////////////////////////////////////////////
// Inputs: clk, reset, addrctl (1-bit), Opcode (6-bit)
   reg clk, rst;
   reg addrctl;
   reg[15:0] ADDRCTL;
   reg[5:0] Op;
///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////
// Output: Next State (NS, 4-bit)
   wire[3:0] NS;
///////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////
// Component is CLOCKED
// Set clk period to 20 in wave
localparam CLK_PERIOD=20;
///////////////////////////////////////////////////////////////////////////////////


   ///////////////////////////////////////
   // SUPPORTED OPCODES
   parameter LW = 6'b100011;
   parameter SW = 6'b101011;
   parameter RTYPE = 6'b000000;
   parameter BEQ = 6'b000100;
   parameter J = 6'b000010;
   parameter ADDI = 6'b001000;
   parameter BNE = 6'b000101;
   parameter SLTI = 6'b001010;
   ///////////////////////////////////////

////////////////////////////////////////////////////////////////////////////
// Subroutine to check the state
task checkState;
   input [3:0] thestate;
   
   begin
   addrctl <= ADDRCTL[thestate];
   #(CLK_PERIOD);
   if (NS!==thestate)
   begin
      $display("Error: Op %d expected %b got %b\n", Op, thestate, NS);
      $stop;
   end
   end
endtask
////////////////////////////////////////////////////////////////////////////



   FSM stateMachine(.clk(clk), .reset(rst), .addrctl(addrctl), .Op(Op), .NS(NS));
   
   initial begin
   ///////////////////////////////////////////////////////
   // ADDRCTL VALUES
   ADDRCTL[0] <= 1; // State 0 always goes to State 1
   ADDRCTL[1] <= 0;
   ADDRCTL[2] <= 0;
   ADDRCTL[3] <= 1; // State 3 always goes to State 4
   ADDRCTL[4] <= 0;
   ADDRCTL[5] <= 0;
   ADDRCTL[6] <= 1; // State 6 always goes to State 7
   ADDRCTL[7] <= 0;
   ADDRCTL[8] <= 0;
   ADDRCTL[9] <= 0;
   ADDRCTL[10] <= 1; // State 10 always goes to State 11
   ADDRCTL[11] <= 0;
   ADDRCTL[12] <= 0;
   ADDRCTL[13] <= 0;
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // TURN THE POWER ON (one tick)
      rst <= 1;  # (CLK_PERIOD);
      rst <= 0;
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // LW: 0->1->2->3->4
   $display("Test LW: 0->1->2->3->4");
      Op <= LW;
      checkState(0);
      checkState(1);
      checkState(2);
      checkState(3);
      checkState(4);
   $display("[PASS]");
   ///////////////////////////////////////////////////////


   ///////////////////////////////////////////////////////
   // SW: 0->1->2->5
   $display("Test SW: 0->1->2->5");
      Op <= SW;
      checkState(0);
      checkState(1);
      checkState(2);
      checkState(5);
   $display("[PASS]");
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // RTYPE: 0->1->6->7
   $display("Test RTYPE: 0->1->6->7");
      Op <= RTYPE;
      checkState(0);
      checkState(1);
      checkState(6);
      checkState(7);
   $display("[PASS]");
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // BEQ: 0->1->8
   $display("Test BEQ: 0->1->8");
      Op <= BEQ;
      checkState(0);
      checkState(1);
      checkState(8);
   $display("[PASS]");
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // J: 0->1->9
   $display("Test J: 0->1->9");
      Op <= J;
      checkState(0);
      checkState(1);
      checkState(9);
   $display("[PASS]");
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // ADDI: 0->1->10->11
   $display("Test ADDI: 0->1->10->11");
      Op <= ADDI;
      checkState(0);
      checkState(1);
      checkState(10);
      checkState(11);
   $display("[PASS]");
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // BNE: 0->1->12
   $display("Test BNE: 0->1->12");
      Op <= BNE;
      checkState(0);
      checkState(1);
      checkState(12);
   $display("[PASS]");
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // SLTI: 0->1->13->11
   $display("Test SLTI: 0->1->13->11");
      Op <= SLTI;
      checkState(0);
      checkState(1);
      checkState(13);
      checkState(11);
   $display("[PASS]");
   ///////////////////////////////////////////////////////

   ///////////////////////////////////////////////////////
   // ENSURE FSM RETURNS TO ZERO
   $display("Test return to State 0");
      checkState(0);
   $display("[PASS]");
   ///////////////////////////////////////////////////////

   $display("All tests passed.\n");

   end

   // Generate clock
   /*always @*
   begin
      clk <= 1;       # (CLK_PERIOD/2);
      clk <= 0;       # (CLK_PERIOD/2);
   end*/
   

  always@(posedge clk)
    begin
      addrctl <= ADDRCTL[NS];
   end
 
endmodule
