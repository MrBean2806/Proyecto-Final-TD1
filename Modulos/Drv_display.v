// Modulo para multiplexar los display de 7 segmentos
// Recibe el numero en bcd y el decoder lo convierte en 7segmentos

module Drv_display(
	input clk,
	input [4:0] u, d, c,
	output reg [2:0] enable = 3'b001,
	output [6:0] segmentos		//Digito a mostrar
);

reg [4:0] bcd = 5'd16;

always @(posedge clk) begin
	if(enable == 3'b100)
		enable <= 3'b001;
	else
		enable <= enable <<< 1;
end

always @(*) begin
	case(enable)
		3'b001: bcd = u;
		3'b010: bcd = d;	
		3'b100: bcd = c;
		default: bcd = 5'd17;
	endcase

end

BCD_7segmentos Decoder (.bcd(bcd), .segmentos(segmentos));

endmodule