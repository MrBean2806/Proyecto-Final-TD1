
module Top(
    input clk,
    input enter,
    input reset,
    input [3:0] fila, 
    output [3:0] col,
    output [6:0] segmentos,
    output [2:0] enable,
    output [2:0] Motores
	);
	

wire enter_sync, cambio, RGB_full, clk_400ms,clk_20ms,clk_2ms;
wire [2:0] flags;
wire [4:0] digito, R, G, B;

Clock_Divider #20000000 Clk_400ms(.clock_in(clk), .clock_out(clk_400ms));
Clock_Divider #1000000 Clk_20ms(.clock_in(clk), .clock_out(clk_20ms));
Clock_Divider #100000 Clk_2ms(.clock_in(clk), .clock_out(clk_2ms));


Driver_teclado teclado(.clk(clk_20ms), .fila(fila),
                    .col(col), .digito(digito), .cambio_digito(cambio));

Memoria_RGB memoria_RGB(.clk(clk), .reset(flags[0]), .digito(digito), .cambio_digito(cambio),
                        .c(R), .d(G), .u(B), .RGB_full(RGB_full));
								
Temporizador timer(.clk(clk_400ms), .enter(enter),
                   .ciclos_R(R), .ciclos_G(G), .ciclos_B(B), .flags(flags) );

Drv_display display(.clk(clk_2ms), .c(R), .d(G), .u(B),
                    .enable(enable), .segmentos(segmentos));    
                                  
FSM fsm(.clk(clk), .reset(reset), .RGB_full(RGB_full),
        .flags(flags), .enter(enter_sync), .Motores(Motores) );



endmodule