`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:35:04 02/17/2021 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Top(
    input clk,
    input enter,
    input reset,
    input [3:0] fila, 
    output [3:0] col,
    output [6:0] segmentos,
    output [2:0] enable,
    output RGB_full
);
//pterm: 20 and input limit: 22

wire clk_40Hz;		//teclado
wire clk_200Hz;	//multiplexado
//reg [7:0] contador = 0;
//wire [2:0] flags;
wire [4:0] digito, R, G, B;
wire [2:0] en;
wire [6:0] seg;
/*
assign clk_200Hz = clk;
assign clk_40Hz = clk;
*/

Clock_Divider #(.N(15), .DIVISOR(20_000)) Clk_200Hz(.clock_in(clk), .clock_out(clk_200Hz));
Clock_Divider #(.N(3), .DIVISOR(5)) Clk_40Hz(.clock_in(clk_200Hz), .clock_out(clk_40Hz));


//niego enable y los segmentos pq los displays son anodo comun
assign enable = ~en;
assign segmentos = ~seg;

Drv_display display(.clk(clk_200Hz), .c(R), .d(G), .u(B),
                    .enable(en), .segmentos(seg));    

Driver_teclado teclado(.clk(clk_40Hz), .fila(fila),
                    .col(col), .digito(digito), .cambio_digito(cambio));

Memoria_RGB memoria_RGB(.clk(clk_40Hz), .reset(reset), .digito(digito), .cambio_digito(cambio),
                        .c(R), .d(G), .u(B), .RGB_full(RGB_full));


endmodule
