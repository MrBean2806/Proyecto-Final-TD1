// Conversor BCD a 7 segmentos

module BCD_7segmentos(
	input [4:0] bcd,
	output reg [6:0] segmentos //MSB = a  ; LSB = g
);

always@(bcd)	begin
	case(bcd)
		5'b00000: segmentos <= 7'b1111110; 
		5'b00001: segmentos <= 7'b0110000; 
		5'b00010: segmentos <= 7'b1101101; 
		5'b00011: segmentos <= 7'b1111001; 
		5'b00100: segmentos <= 7'b0110011; 
		5'b00101: segmentos <= 7'b1011011; 
		5'b00110: segmentos <= 7'b1011111; 
		5'b00111: segmentos <= 7'b1110000; 
		5'b01000: segmentos <= 7'b1111111; 
		5'b01001: segmentos <= 7'b1111011; 
		5'b01010: segmentos <= 7'b1110111; 
		5'b01011: segmentos <= 7'b0011111; 
		5'b01100: segmentos <= 7'b1001110; 
		5'b01101: segmentos <= 7'b0111101; 
		5'b01110: segmentos <= 7'b1001111; 
		5'b01111: segmentos <= 7'b1000111;
		5'b10000: segmentos <= 7'b0000000;
		5'b10001: segmentos <= 7'b0000001;
		default: segmentos <= 7'b0000000;
	endcase
	
end

endmodule