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
module cdu(
	input clk,
	input [4:0] digito,
	input [1:0] desp,
	output reg [4:0] u,d,c = 5'd16
);

always @(posedge clk) begin

	case(desp)
		2'b00: begin 	
					u <= digito;
					d <= 5'd16;
					c <= 5'd16;	
				 end
		2'b01: begin 
					u <= digito;
					d <= u;
					c <= 5'd16;	
				 end
		2'b10: begin 
					u <= digito;
					d <= u;
					c <= d;	
				end
		default: begin
					u <= 5'd17;
					d <= 5'd17;
					c <= 5'd17;
					end
	endcase

end

endmodule
