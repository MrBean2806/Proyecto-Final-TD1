module Top(
    input clk,
    input enter,
    input [3:0] fila, 
    output reg [3:0] col,
    output [6:0] segmentos,
    output [2:0] enable,
    output reg [2:0] Motores
)
wire enter_sync;
wire [1:0] select;
wire [2:0] flags;
wire [4:0] digito, R, G, B;

Clock_Divider Clk_100ms #5000000 (.clock_in(clk), .clock_out(clk_100ms));

Drv_teclado teclado(.clk(clk), .enter(enter), .fila(fila), .col(col),
                    .digito(digito), . desp(select), .enter_sync(enter_sync));

Memoria_RGB memoria_RGB(.clk(clk), .digito(digito), .sel(select),
                        .u(R), .d(G), .c(B));

temporizador timer(.clk(clk), .enter(enter_sync),
                   .R(R), .G(G), .B(B), .flags(flags) );

Drv_display display(.clk(clk), .u(R), .d(G), .c(B)
                    .enable(enable), .segmentos(segmentos));    
                                  
FSM fsm(.clk(clk), .reset(reset),
        .flag_R(flags[2]), flag_G(flags[1]), .flag_B(flags[2]),
        .cambio(cambio_digito), .enter(enter) );




endmodule