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
wire enter_sync, cambio, RGB_full, clk_60ms, clk_400ms;
wire [2:0] flags;
wire [3:0] col_;
wire [4:0] digito, R, G, B;

always @(posedge clk) begin
    col <= col_;
end

Clock_Divider #3000000 Clk_60ms(.clock_in(clk), .clock_out(clk_60ms));
Clock_Divider #20000000 Clk_400ms(.clock_in(clk), .clock_out(clk_400ms));

Driver_teclado teclado(.clk(clk_60ms), .enter(enter), .fila(fila),
                    .col(col_), .digito(digito), .cambio_digito(cambio), .enter_sync(enter_sync));

Memoria_RGB memoria_RGB(.clk(clk_60ms), .digito(digito), .cambio_digito(cambio),
                        .u(R), .d(G), .c(B), .RGB_full(RGB_full));

temporizador timer(.clk(clk_400ms), .enter(enter_sync),
                   .ciclos_R(R), .ciclos_G(G), .ciclos_B(B), .flags(flags) );

Drv_display display(.clk(clk), .u(R), .d(G), .c(B),
                    .enable(enable), .segmentos(segmentos));    
                                  
FSM fsm(.clk(clk), .reset(reset), .RGB_full(RGB_full),
        .flags(flags), .enter(enter), .Motores(Motores) );


endmodule