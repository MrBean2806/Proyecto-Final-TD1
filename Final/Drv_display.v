// Modulo para multiplexar los display de 7 segmentos
// Recibe el numero en hex y el decoder lo convierte en 7segmentos

module Drv_display(
	input clk,
	input [4:0] u, d, c,
	output reg [2:0] enable = 3'b001,
	output [6:0] segmentos		//Digito a mostrar
);

reg [4:0] hex = 5'd16;
reg [1:0] estado = 2'd0;

always @(posedge clk) begin
	if(estado >= 2'b10)
		estado <= 2'd0; 
	else 
		estado <= estado + 2'd1;
end

always @(*) begin
	case(estado)
		2'b00: begin 
					hex <= u; 
					enable <= 3'b100; 
				 end
		2'b01: begin 
					hex <= d; 
					enable <= 3'b010; 
				 end
		2'b10: begin 
					hex <= c; 
					enable <= 3'b001; 
				 end
		default: begin 
					hex <= 5'd17;
					enable <= 3'd7; 	
					end
	endcase
end

Hex_7segmentos Decoder (.hex(hex), .segmentos(segmentos));

endmodule