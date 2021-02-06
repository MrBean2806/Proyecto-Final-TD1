`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:29:15 01/08/2021 
// Design Name: 
// Module Name:    cdu 
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

//Recibe los digitos ingresados por teclado y los junta en un numero de 3 digitos
module Memoria_RGB(
	input clk,
	input [4:0] digito,
	input cambio_digito,
	//input [1:0] sel,
	output reg [4:0] u,d,c = 5'd16,
	output RGB_full
);
reg [2:0] sel = 0;

always @(posedge clk) begin
	if( cambio_digito )	begin
		if( sel == 3'b111 )
			sel <= 0;	
		else
			sel <= sel + 1;
	end
end

always @(posedge clk) begin
	//sel aumenta cada pulso de clk
	//cada vez q se desplazan los valores luego tienen q mantenerse hasta q vuelva a apretarse un boton
	case(sel)
		3'b000: begin 	
					u <= digito;
					d <= 5'd16;
					c <= 5'd16;	
				 end
		3'b010: begin 
					u <= digito;
					d <= u;
					c <= 5'd16;	
				 end
		3'b100: begin 
					u <= digito;
					d <= u;
					c <= d;	
				end
		default: begin
					u <= u;
					d <= d;
					c <= c;
					end
	endcase

end

assign RGB_full = sel[2] & (~sel[1]) & (~sel[0]); 	//es 1 cuando sel == 3'b100

endmodule
