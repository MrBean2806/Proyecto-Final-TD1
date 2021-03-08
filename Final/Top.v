module Top(
    input clk, enter, reset,
    input [3:0] fila, 
    output [3:0] col,
    output [6:0] segmentos,
    output [2:0] enable,
    output cambio,
	 output [1:0] dig
);
//pterm: 20 and input limit: 22
wire [4:0] digito;


wire clk_5ms;		//teclado
wire clk_2ms;	//display
//
//wire clk_40Hz;		//teclado
//wire clk_200Hz;	//display
//Clock_Divider #(.N(15), .DIVISOR(20_000)) Clk_200Hz(.clock_in(clk), .clock_out(clk_200Hz));
//Clock_Divider #(.N(3), .DIVISOR(5)) Clk_40Hz(.clock_in(clk_200Hz), .clock_out(clk_40Hz));

Clock_Divider #100_000 Clk_2ms(.clock_in(clk), .clock_out(clk_2ms));
Clock_Divider #500_000 Clk_5ms(.clock_in(clk), .clock_out(clk_5ms));

Driver_teclado teclado(.clk(clk_5ms), .fila(fila),
                    .col(col), .digito(digito), .cambio_digito(cambio));
						  
Drv_display display(.clk(clk_2ms), .c(digito), .d(5'd4), .u(5'hE),
                    .enable(enable), .segmentos(segmentos));    
						  
assign dig = ~digito[1:0];  

endmodule
















