
module MicroROM(state, microinstruction);

  input [3:0] state; 
  reg [16:0] ROM[15:0];
  output wire [16:0] microinstruction;

  ///////////////////////////////////////////////////////
  // PUT MICROINSTRUCTIONS HERE
  initial begin
  ROM[4'b0000] = 		17'b10001000000100001;	//0

  ROM[4'b0001] =		17'b00000000001100000;	//1

  ROM[4'b0010] =		17'b00000000001010000;	//2

  ROM[4'b0011] =		17'b00100000000000001; 	//3

  ROM[4'b0100] =		17'b00000100000001000;	//4

  ROM[4'b0101] =		17'b00110000000000000;	//5

  ROM[4'b0110] =		17'b00000000100010001; 	//6

  ROM[4'b0111] = 		17'b00000000000001100; 	//7

  ROM[4'b1000] = 		17'b01000001010010000;	//8

  ROM[4'b1001] = 		17'b10000010000000000;	//9
  
  ROM[4'b1010] =  		17'b00000000001010001;	//10
  
  ROM[4'b1011] =		17'b00000000000001000;	//11


  ////////////////////////////////////////////////////////////////////////
  end

  //always  @*
  assign microinstruction = ROM[state];

endmodule