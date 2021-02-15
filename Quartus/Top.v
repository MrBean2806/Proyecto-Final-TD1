
module Top(
    input clk,
    input enter,
    input reset,
    input [3:0] fila, 
    output [3:0] col,
    output [6:0] segmentos,
    output [2:0] enable,
    output [2:0] Motores,
	 output enter_test
	);
	wire enter_sync, cambio, RGB_full, clk_60ms, clk_400ms;
	wire [2:0] flags;
	wire [4:0] digito, R, G, B;

	//always @(posedge clk) begin
	//    col <= col_;
	//end

	assign clk_60ms = clk;
	assign clk_400ms = clk;
	//Clock_Divider #3/*000000*/ Clk_60ms(.clock_in(clk), .clock_out(clk_60ms));
	//Clock_Divider #20/*000000*/ Clk_400ms(.clock_in(clk), .clock_out(clk_400ms));

	Driver_teclado teclado(.clk(clk_60ms), .enter(enter), .fila(fila),
							  .col(col), .digito(digito), .cambio_digito(cambio), .enter_sync(enter_sync));

	Memoria_RGB memoria_RGB(.clk(clk_60ms), .reset(flags[0]), .digito(digito), .cambio_digito(cambio),
									.c(R), .d(G), .u(B), .RGB_full(RGB_full));

	Temporizador timer(.clk(clk_400ms), .enter(enter_sync),
							 .ciclos_R(R), .ciclos_G(G), .ciclos_B(B), .flags(flags) );

	Drv_display display(.clk(clk_60ms), .c(R), .d(G), .u(B),
							  .enable(enable), .segmentos(segmentos));    
												 
	FSM fsm(.clk(clk), .reset(reset), .RGB_full(RGB_full),
			  .flags(flags), .enter(enter_sync), .Motores(Motores) );
			  
	Filtro_Rebote(.clk(clk),.pulso_real(enter),.pulso_ideal(enter_test));

endmodule