// Modulo para multiplexar los display de 7 segmentos
// Recibe el numero en bcd y el decoder lo convierte en 7segmentos

module Drv_display(
	input clk,
	input [4:0] u, d, c,
	output reg [2:0] enable = 3'b000,
	output [6:0] segmentos		//Digito a mostrar
);
reg [4:0] bcd;
reg [1:0] estado = 2'd0;
//mepa q no hace falta estado, se puede usar enable para ir
//haciendo las transiciones
always @(posedge clk) begin
		
		if(estado >= 2'd2)
			estado <= 2'd0;
		else
			estado <= estado + 2'd1;
end

always @(*) begin
	case (estado)
		2'd0: begin
					enable <= 3'b100;
					bcd <= u;
				end
		2'd1: begin
					enable <= 3'b010;
					bcd <= d;
				end
		2'd2: begin
					enable <= 3'b001;
					bcd <= c;
				end
		default: begin
					enable <= 3'b100;
					bcd <= 5'b10001;
					end
	endcase
end

BCD_7segmentos Decoder (.bcd(bcd), .segmentos(segmentos));

endmodule