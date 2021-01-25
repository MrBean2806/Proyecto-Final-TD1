module Drv_teclado(
	input clk,		//clk de 100Hz
	input [3:0] fila,
	output reg [3:0] col = 4'b0001,
	output reg [4:0] digito = 0,
	output reg [1:0] desp = 0
	//output reg cambio_digito;
);

reg [4:0] aux = 5'b10000;
reg [3:0] counter = 0;

always @(posedge clk) begin
	if(fila == 4'd0) begin
		digito <= digito;
	end
	else	begin
		if(desp == 2'b10)
			desp <= 0;
		else 
			desp <= desp + 1;
		
		digito <= aux;
	end
	//shift aritmetico
	begin
		col <= col <<< 1;
		if(col == 4'b1000)
			col <= 4'b0001;
	end

end

always @(fila, col, digito, aux) begin
	case(col)
		4'b0001: begin
					case(fila)
						4'b0001: aux <= 5'd1;
						4'b0010: aux <= 5'd4;
						4'b0100: aux <= 5'd7;
						4'b1000: aux <= 5'hF;
						default: aux <= 5'd16;
					endcase
				 end
		4'b0010: begin
					case(fila)
						4'b0001: aux <= 5'd2;
						4'b0010: aux <= 5'd5;
						4'b0100: aux <= 5'd8;
						4'b1000: aux <= 5'd0;
						default: aux <= 5'd16;
					endcase
				 end
		4'b0100: begin
					case(fila)
						4'b0001: aux <= 5'd3;
						4'b0010: aux <= 5'd6;
						4'b0100: aux <= 5'd9;
						4'b1000: aux <= 5'hE;
						default: aux <= 5'd16;
					endcase
				 end
		4'b1000: begin
					case(fila)
						4'b0001: aux <= 5'hA;
						4'b0010: aux <= 5'hB;
						4'b0100: aux <= 5'hC;
						4'b1000: aux <= 5'hD;
						default: aux <= 5'd16;
					endcase
				 end
		default: begin
					aux <= 5'b10001;
				 end
	endcase
end

endmodule