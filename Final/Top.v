module Top(
    input clk, enter, reset,
    input [3:0] col, 
    output [3:0] fila,
    output [6:0] segmentos,
    output [2:0] enable,
    output [2:0] leds,
	 output [2:0] motores
);

wire [4:0] digito,U,D,C;
wire clk_5ms;		
wire clk_2ms, clk_1ms,clk_400ms;
wire clk_test;	 
wire full;
wire cambio;
wire [2:0] flags;
wire trigger;
wire [2:0]estado;
wire reset_memoria;
wire [2:0]m;

Clock_Divider #50_000 Clk_1ms(.clock_in(clk), .clock_out(clk_1ms));
Clock_Divider #100_000 Clk_2ms(.clock_in(clk), .clock_out(clk_2ms));
//Clock_Divider #250_000 Clk_5ms(.clock_in(clk), .clock_out(clk_5ms));
Clock_Divider #40_000_000 Clk_800ms(.clock_in(clk), .clock_out(clk_400ms));
//Clock_Divider #125_000 Clk_test(.clock_in(clk), .clock_out(clk_test));

//Filtro_Rebote #20 filtro(.clk(clk),.pulso_real(enter),.pulso_ideal(enter_f)); //Parametro Tiempo encendido en ms

Driver_teclado teclado(.clk(clk_1ms), .fila(fila),
                    .col(col), .digito(digito), .cambio_digito(cambio));
						  
Memoria_RGB memoria(.clk(clk_1ms),.reset(reset_memoria),.digito(digito),.cambio_digito(cambio),.u(U),.d(D),.c(C),.RGB_full(full));

						  						  
Drv_display display(.clk(clk_2ms), .c(C), .d(D), .u(U),
                    .enable(enable), .segmentos(segmentos));    
						  
Temporizador timer(.clk(clk_400ms), .trigger(trigger),.reset(reset),
                   .ciclos_R(C), .ciclos_G(D), .ciclos_B(U), .flags(flags) );						  

FSM fsm(.clk(clk), .reset(reset), .RGB_full(full),
        .flags(flags), .enter(enter), .Motores(m),.trigger(trigger),.est(estado));						  

						  
//assign leds[0] = ~cambio;
//assign leds[1]= ~enter_f;
//assign leds[2] = ~full;

assign leds[2:0] = {~estado[0],~estado[1],~estado[2]};
assign reset_memoria =  ~flags[0] & reset;
assign motores=~m;
endmodule
















