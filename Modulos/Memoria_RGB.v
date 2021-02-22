`timescale 1ns / 1ps

//Recibe los digitos ingresados por teclado y los junta en un numero de 3 digitos
module Memoria_RGB(
	input clk,
	input reset,	//reset por alto
	input [4:0] digito,
	input cambio_digito,
	output reg [4:0] u = 5'd16,
	output reg [4:0] d = 5'd16,
	output reg [4:0] c = 5'd16,
	output RGB_full
);
reg [2:0] sel = 0;

/*initial begin
		$display("time   sel   digito   c   d   u   ");
		$monitor("(%6d ns)   %b   %h   %h   %h   %h", $time, sel, digito, c, d, u);
	end	
*/
always @(posedge clk) begin
	if( reset )	begin
		sel <= 0;
		u <= 5'd16;
		d <= 5'd16;
		c <= 5'd16;
	end
	else begin
	//sel aumenta cada pulso de clk
	//cada vez q se desplazan los valores u,d,c tienen q mantenerse hasta q vuelva a apretarse un boton
		case(sel)
			3'b001: begin 	
						u <= digito;
						d <= 5'd16;
						c <= 5'd16;
						sel <= sel + 1;	
					end
			3'b011: begin 
						u <= digito;
						d <= u;
						c <= 5'd16;
						sel <= sel + 1;		
					end
			3'b101: begin 
						u <= digito;
						d <= u;
						c <= d;
						sel <= 0;		//reseteo
					end
			default: begin
						u <= u;
						d <= d;
						c <= c;
						if(cambio_digito)
							sel <= sel + 1;
						end
		endcase
	end

end

assign RGB_full = (~u[4]) & (~d[4]) & (~c[4]); 	//es 1 cuando ninguno es 5'h10 = 5'b10000 (los MSB son 0)

endmodule
