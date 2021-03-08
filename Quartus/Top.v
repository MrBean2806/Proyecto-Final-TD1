
module Top(
    input clk,
    input enter,
    input reset,
    input [3:0] fila, 
    output [3:0] col,
    output [6:0] segmentos,
    output [2:0] enable,
	 output cambio
    //output [2:0] Motores
	);
	

//wire cambio, RGB_full, clk_400ms,clk_20ms,clk_2ms, reset_memoria;
wire clk_2ms, clk_20ms;
//wire [2:0] flags;
wire [4:0] digito, R, G, B;
//assign reset_memoria =  ~flags[0] & reset;	//reset por bajo

//Clock_Divider #20000000 Clk_400ms(.clock_in(clk), .clock_out(clk_400ms));
Clock_Divider #1000000 Clk_20ms(.clock_in(clk), .clock_out(clk_20ms));
Clock_Divider #100000 Clk_2ms(.clock_in(clk), .clock_out(clk_2ms));
//
//
Driver_teclado teclado(.clk(clk_20ms), .fila(fila),
                    .col(col), .digito(digito), .cambio_digito(cambio));
//
//Memoria_RGB memoria_RGB(.clk(clk), .reset( reset_memoria ), .digito(digito), .cambio_digito(cambio),
//                        .c(R), .d(G), .u(B), .RGB_full(RGB_full));
//								
//Temporizador timer(.clk(clk_400ms), .enter(enter),
//                   .ciclos_R(R), .ciclos_G(G), .ciclos_B(B), .flags(flags) );
//
Drv_display display(.clk(clk_2ms), .c(digito), .d(5'd0), .u(5'hF),
                    .enable(enable), .segmentos(segmentos));    
//                                  
//FSM fsm(.clk(clk), .reset(reset), .RGB_full(RGB_full),
//        .flags(flags), .enter(enter), .Motores(Motores));

//Para Simulacion

//assign clk_400ms = clk;
//assign clk_20ms = clk;
//assign clk_2ms = clk;
//

//Driver_teclado teclado(.clk(clk_2ms), .fila(fila),
//                    .col(col), .digito(digito), .cambio_digito(cambio));
//
////Memoria_RGB memoria_RGB(.clk(clk), .reset( reset_memoria ), .digito(digito), .cambio_digito(cambio),
////                        .c(R), .d(G), .u(B), .RGB_full(RGB_full));
//								
////Temporizador timer(.clk(clk_400ms), .enter(enter),
////                   .ciclos_R(R), .ciclos_G(G), .ciclos_B(B), .flags(flags) );
////
//Drv_display display(.clk(clk_2ms), .c(R), .d(G), .u(B),
//                    .enable(enable), .segmentos(segmentos));    
////                                  
////FSM fsm(.clk(clk), .reset(reset), .RGB_full(RGB_full),
//        .flags(flags), .enter(enter), .Motores(Motores) ,.est(estado));



endmodule