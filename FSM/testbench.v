`timescale 1ps / 1ps



// SET CLOCK TO 20
// RUN (number of state changes)*20
// CURRENTLY: 600 SHOULD BE ENOUGH




module testbench();
   reg clk, rst;
   reg addrctl;
   reg[5:0] Op;
   wire[3:0] NS;
   reg[15:0] ADDRCTL;

   localparam CLK_PERIOD = 20;

   ///////////////////////////////////////
   // SUPPORTED OPCODES
   parameter LW = 6'b100011;
   parameter SW = 6'b101011;
   parameter RTYPE = 6'b000000;
   parameter BEQ = 6'b000100;
   parameter J = 6'b000010;
   parameter ADDI = 6'b001000;
   parameter BNE = 6'b000101;
   ///////////////////////////////////////

task checkState;
   input [3:0] thestate;
   
   begin
   addrctl <= ADDRCTL[thestate];
   #(CLK_PERIOD);
   if (NS!==thestate)
   begin
      $display("Error: Op %d expected %d got %d\n", Op, NS, thestate);
      $stop;
   end
   end
endtask


   FSM stateMachine(clk, rst, addrctl, Op, NS);
   
   initial begin
   ///////////////////////////////////////
   // ADDRCTL VALUES
   ADDRCTL[0] <= 1;
   ADDRCTL[1] <= 0;
   ADDRCTL[2] <= 0;
   ADDRCTL[3] <= 1;
   ADDRCTL[4] <= 0;
   ADDRCTL[5] <= 0;
   ADDRCTL[6] <= 1;
   ADDRCTL[7] <= 0;
   ADDRCTL[8] <= 0;
   ADDRCTL[9] <= 0;
   ADDRCTL[10] <= 1;
   ADDRCTL[11] <= 0;
   ADDRCTL[12] <= 0;
   ////////////////////////////////////////


      rst <= 1;  # (CLK_PERIOD);
      rst <= 0;


      Op <= LW;
      checkState(0);
      checkState(1);
      checkState(2);
      checkState(3);
      checkState(4);

      Op <= SW;
      checkState(0);
      checkState(1);
      checkState(2);
      checkState(5);

      Op <= RTYPE;
      checkState(0);
      checkState(1);
      checkState(6);
      checkState(7);

      Op <= BEQ;
      checkState(0);
      checkState(1);
      checkState(8);

      Op <= J;
      checkState(0);
      checkState(1);
      checkState(9);

      Op <= ADDI;
      checkState(0);
      checkState(1);
      checkState(10);
      checkState(11);

      Op <= BNE;
      checkState(0);
      checkState(1);
      checkState(12);
      
      checkState(0);

      $display("All tests passed.\n");

   end


   // Generate clock
   always @*
   begin
      clk <= 1;       # (CLK_PERIOD/2);
      clk <= 0;       # (CLK_PERIOD/2);
   end
   

  always@(posedge clk)
    begin
      addrctl <= ADDRCTL[NS];
   end
 
endmodule
