// Multiplexor 4 a 1 bus de 4 para manejar los display de 7 segmentos

module Drv_display(
	input clk,
	//input [1:0] desp,
	input [4:0] u, d, c,
	output reg [2:0] enable = 3'b000,
	output reg [6:0] segmentos = 7'b0		//Digito a mostrar
);
reg [4:0] bcd;
reg [1:0] estado = 2'd0;

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