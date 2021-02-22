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
wire enter_sync, cambio, RGB_full, clk_100ms, clk_400ms;
wire [2:0] flags;
wire [4:0] digito, R, G, B;

//always @(posedge clk) begin
//    col <= col_;
//end

//assign clk_60ms = clk;
assign clk_400ms = clk;
Clock_Divider #5_000_000 Clk_100ms(.clock_in(clk), .clock_out(clk_100ms));
//Clock_Divider #20000000 Clk_400ms(.clock_in(clk), .clock_out(clk_400ms));

Driver_teclado teclado(.clk(clk_100ms), .fila(fila),
                    .col(col), .digito(digito), .cambio_digito(cambio));

Memoria_RGB memoria_RGB(.clk(clk_100ms), .reset(flags[0]), .digito(digito), .cambio_digito(cambio),
                        .c(R), .d(G), .u(B), .RGB_full(RGB_full));
//no hace falta otro divisor, puede usarse el clk de 100ms y contar hasta 4 pulsos
temporizador timer(.clk(clk_100ms), .enter(enter),
                   .ciclos_R(R), .ciclos_G(G), .ciclos_B(B), .flags(flags) );

Drv_display display(.clk(clk_100ms), .c(R), .d(G), .u(B),
                    .enable(enable), .segmentos(segmentos));    
                                  
FSM fsm(.clk(clk), .reset(reset), .RGB_full(RGB_full),
        .flags(flags), .enter(enter_sync), .Motores(Motores) );


endmodule