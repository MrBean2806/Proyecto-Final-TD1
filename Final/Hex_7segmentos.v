// Conversor HEX a 7 segmentos

module Hex_7segmentos(
	input [4:0] hex,
	output reg [6:0] segmentos = 7'd0 //MSB = a  ; LSB = g
);

always@(hex)	begin
	case(hex)
		5'b00000: segmentos = 7'b1111110; // 0
		5'b00001: segmentos = 7'b0110000; // 1
		5'b00010: segmentos = 7'b1101101; // 2
		5'b00011: segmentos = 7'b1111001; // 3
		5'b00100: segmentos = 7'b0110011; // 4
		5'b00101: segmentos = 7'b1011011; // 5 
		5'b00110: segmentos = 7'b1011111; // 6
		5'b00111: segmentos = 7'b1110000; // 7 
		5'b01000: segmentos = 7'b1111111; // 8 
		5'b01001: segmentos = 7'b1111011; // 9
		5'b01010: segmentos = 7'b1110111; // A
		5'b01011: segmentos = 7'b0011111; // B
		5'b01100: segmentos = 7'b1001110; // C 
		5'b01101: segmentos = 7'b0111101; // D 
		5'b01110: segmentos = 7'b1001111; // E 
		5'b01111: segmentos = 7'b1000111; // F
		5'b10000: segmentos = 7'b0000000; // d'16 (blanco)
		5'b10001: segmentos = 7'b0000001; // d'17 (guion)
		default: segmentos = 7'b0000000;  //
	endcase
	
end

endmodule