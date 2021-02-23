
`timescale 1ns / 1ps
module Temporizador_tb  ; 

  wire  [2:0]  flags   ; 
  reg  [4:0]  ciclos_B   ; 
  reg  [4:0]  ciclos_R   ; 
  reg    enter   ; 
  reg    clk   ; 
  reg  [4:0]  ciclos_G   ; 
  Temporizador  DUT  ( 
       .flags (flags ) ,
      .ciclos_B (ciclos_B ) ,
      .ciclos_R (ciclos_R ) ,
      .enter (enter ) ,
      .clk (clk ) ,
      .ciclos_G (ciclos_G ) ); 



initial begin forever #5 clk = ~clk; end
	initial begin
		// Initialize Inputs
		clk = 0;
		enter = 0;
		ciclos_R = 5'd5;
		ciclos_G = 5'd10;
		ciclos_B = 5'd15;

		// Wait 100 ns for global reset to finish
		#100;
        
		enter = 1;
		#100 enter = 0;
	end
	
  initial
	#2000 $stop;
endmodule
