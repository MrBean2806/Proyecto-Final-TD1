
`timescale 1ns / 1ps
module Drv_Teclado_tb  ; 

parameter col_3  = 4'b0100 ;
parameter fila_1  = 4'b0001 ;
parameter col_4  = 4'b1000 ;
parameter fila_2  = 4'b0010 ;
parameter fila_3  = 4'b0100 ;
parameter col_1  = 4'b0001 ;
parameter fila_4  = 4'b1000 ;
parameter col_2  = 4'b0010 ; 
  wire  [4:0]  digito   ; 
  reg  [3:0]  fila   ; 
  wire cambio_digito   ; 
  wire  [3:0]  col   ; 
  reg    clk   ; 
  Driver_teclado    #( col_3 , fila_1 , col_4 , fila_2 , fila_3 , col_1 , fila_4 , col_2  )
   DUT  ( 
       .digito (digito ) ,
      .fila (fila ) ,
      .cambio_digito (cambio_digito ) ,
      .col (col ) ,
      .clk (clk ) ); 



// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ps, End Time = 1 us, Period = 20 ns
  initial begin forever #10 clk = ~clk; end
	initial begin
		clk = 0;
		fila = 0;
		#60

		fila = 4'b0001;
		#20
		fila = 4'b0;
		
		#60
		fila = 4'b0010;
		#20
		fila = 4'b0;
		
		#60
		fila = 4'b0100;
		#20
		fila = 4'b0;
		
		#80
		fila = 4'b0001;
		#20
		fila = 4'b0;

	end
      
  initial
	#2000 $stop;
endmodule
