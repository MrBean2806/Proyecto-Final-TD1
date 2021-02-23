
`timescale 1ns / 1ps
module Top_tb  ; 
 
  reg  [3:0]  fila   ; 
  wire  [2:0]  Motores   ; 
  wire  [6:0]  segmentos   ; 
  wire  [3:0]  col   ; 
  reg    enter   ; 
  reg    clk   ; 
  wire  [2:0]  enable   ; 
  reg    reset   ; 
  Top  
   DUT  ( 
       .fila (fila ) ,
      .Motores (Motores ) ,
      .segmentos (segmentos ) ,
      .col (col ) ,
      .enter (enter ) ,
      .clk (clk ) ,
      .enable (enable ) ,
      .reset (reset ) ); 



initial begin forever #10 clk = ~clk; end		//f = 50MHz
	initial begin
		// Initialize Inputs
		clk = 0;
		enter = 0;
		reset = 1;	
		fila = 0;
		#60
		
	//Escribo una A
		fila = 4'b0001;
		#20
		fila = 4'b0;
	//Escribo una B	
		#60
		fila = 4'b0010;
		#20
		fila = 4'b0;
	//Escribo una C
		#60
		fila = 4'b0100;
		#20
		fila = 4'b0;
	//Aprieto el enter para empezar la carga
		#80
		enter = 1;
		#20 enter = 0;
		
		#2000 $stop;
	end

endmodule
