// Modulo para multiplexar los display de 7 segmentos
// Recibe el numero en bcd y el decoder lo convierte en 7segmentos

module Drv_display(
	input clk,
	input [4:0] u, d, c,
	output reg [2:0] enable = 3'b000,
	output [6:0] segmentos		//Digito a mostrar
);
reg [4:0] bcd;

always @(posedge clk) begin
	case (enable)
		3'b001: begin
					bcd <= d;
					enable <= enable <<< 1; 
				end
		3'b010: begin
					bcd <= c;
					enable <= enable <<< 1; 
				end
		3'b100: begin
					bcd <= u;
					enable <= 3'b001;
				end
		default: begin
					enable <= 3'b001;
					bcd <= 5'b10001;
				end
	endcase
end

BCD_7segmentos Decoder (.bcd(bcd), .segmentos(segmentos));

endmodule