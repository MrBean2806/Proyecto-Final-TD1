// Modulo para multiplexar los display de 7 segmentos
// Recibe el numero en bcd y el decoder lo convierte en 7segmentos

module Drv_display(
	input clk,
	input [4:0] u, d, c,
	output reg [2:0] enable = 3'b001,
	output [6:0] segmentos		//Digito a mostrar
);
reg [4:0] hex = 0;

Hex_7segmentos Decoder (.hex(hex), .segmentos(segmentos));

always @(posedge clk) begin
	if(enable == 3'b100)
		enable <= 3'b001;
	else
		enable <= enable <<< 1;
end

always @(*) begin
	case(enable)
		3'b001: hex = u;
		3'b010: hex = d;	
		3'b100: hex = c;
		default: hex = 5'b11111;
	endcase

end



endmodule