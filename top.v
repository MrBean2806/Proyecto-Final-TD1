module Top(
    input clk,
    input enter,
    input reset,
    input [3:0] fila, 
    output reg [3:0] col,
    output [6:0] segmentos,
    output [2:0] enable,
    output [2:0] Motores
);
wire enter_sync, cambio, RGB_full, clk_100ms;
wire [2:0] flags;
wire [3:0] col_;
wire [4:0] digito, R, G, B;

always @(posedge clk) begin
    col <= col_;
end

Clock_Divider #5000000 Clk_100ms(.clock_in(clk), .clock_out(clk_100ms));

Drv_teclado teclado(.clk(clk), .enter(enter), .fila(fila),
                    .col(col_), .digito(digito), .cambio_digito(cambio), .enter_sync(enter_sync));

Memoria_RGB memoria_RGB(.clk(clk), .digito(digito), .cambio_digito(cambio),
                        .u(R), .d(G), .c(B), .RGB_full(RGB_full));

temporizador timer(.clk(clk), .enter(enter_sync),
                   .ciclos_R(R), .ciclos_G(G), .ciclos_B(B), .flags(flags) );

Drv_display display(.clk(clk), .u(R), .d(G), .c(B),
                    .enable(enable), .segmentos(segmentos));    
                                  
FSM fsm(.clk(clk), .reset(reset), .RGB_full(RGB_full),
        .flags(flags), .enter(enter), .Motores(Motores) );


endmodule