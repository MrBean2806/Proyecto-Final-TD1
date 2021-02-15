
`timescale 1ns / 1ns
module Filtro_Rebote_tb  ; 

parameter duracion_ms  = 50 ; 
  wire  pulso_ideal   ; 
  reg    pulso_real   ; 
  reg    clk   ; 
  Filtro_Rebote    #( duracion_ms  )
   DUT  ( 
       .pulso_ideal (pulso_ideal ) ,
      .pulso_real (pulso_real ) ,
      .clk (clk ) ); 

// "Clock Pattern" : dutyCycle = 50
// Start Time = 0 ns, End Time = 1 us, Period = 20 ns
  initial
  begin
	  clk  = 1'b0  ;
	 # 10 ;
// 10 ns, single loop till start period.
   repeat(200)
   begin
	   clk  = 1'b1  ;
	  #10  clk  = 1'b0  ;
	  #10 ;
// 990 ns, repeat pattern in loop.
   end
	  clk  = 1'b1  ;
	 # 10 ;
// dumped values till 1 us
  end

  initial begin
	
	pulso_real = 0;
	# 30 ;
	pulso_real = 1;
	#10;
	pulso_real = 0;
	#5;
	pulso_real = 1;
	#6;
	pulso_real = 0;
	#8;
	pulso_real = 1;
	#4;
	pulso_real = 0;
	#9;
	pulso_real = 1;
	#40;
	pulso_real = 0;
	
	# 60 ;
	pulso_real = 1;
	#10;
	pulso_real = 0;
	#5;
	pulso_real = 1;
	#6;
	pulso_real = 0;
	#8;
	pulso_real = 1;
	#4;
	pulso_real = 0;
	#9;
	pulso_real = 1;
	#60;
	pulso_real = 0;
	
	# 75 ;
	pulso_real = 1;
	#4;
	pulso_real = 0;
	#6;
	pulso_real = 1;
	#2;
	pulso_real = 0;
	#8;
	pulso_real = 1;
	#1;
	pulso_real = 0;
	#5;
	pulso_real = 1;
	#30;
	pulso_real = 0;
	
	
	#2000 $stop;
	end

endmodule
