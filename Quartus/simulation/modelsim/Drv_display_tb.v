
`timescale 1ns / 1ps
module Drv_display_tb  ; 
 
  reg  [4:0]  d   ; 
  wire  [6:0]  segmentos   ; 
  reg  [4:0]  u   ; 
  reg    clk   ; 
  wire  [2:0]  enable   ; 
  reg  [4:0]  c   ; 
  Drv_display  
   DUT  ( 
       .d (d ) ,
      .segmentos (segmentos ) ,
      .u (u ) ,
      .clk (clk ) ,
      .enable (enable ) ,
      .c (c ) ); 



// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ps, End Time = 1 us, Period = 20 ns
  initial
  begin
	  clk  = 1'b0  ;
	 # 10 ;
// dumped values till 1 ns
	repeat(59) begin
	clk = 1'b1;
	#10;
	clk = 1'b0;
	#10;
	end
	clk = 1'b0;

  end

	initial begin
		u = 5'd0;
		d = 5'd0;
		c = 5'd0;
		#80;
		u = 5'd3;
		d = 5'd5;
		c = 5'hF;
		#80;
	   u = 5'd0;
		d = 5'hA;
		c = 5'd6;
		#80;
		u = 5'd9;
		d = 5'hF;
		c = 5'd1;
		#80;
		u = 5'd0;
		d = 5'd0;
		c = 5'd0;
		
		#2000 $stop;
	end
	
endmodule
