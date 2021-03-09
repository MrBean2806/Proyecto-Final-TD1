module Driver_teclado(
	input clk,		//clk de 100Hz
	input [3:0] col,
	output reg[3:0] fila,
	output reg [4:0] digito = 5'd16,
	output reg cambio_digito = 0
);

 
reg [4:0] aux = 5'd16;
reg [1:0] estado,est, pulso = 2'd0;

parameter fila_1 = 4'b0001, col_1 = 4'b0001,
		  fila_2 = 4'b0010, col_2 = 4'b0010,
		  fila_3 = 4'b0100, col_3 = 4'b0100,
		  fila_4 = 4'b1000, col_4 = 4'b1000;

always @(posedge clk) begin
	begin
	estado <= estado + 2'd1;
	end
end

always@(posedge clk) begin
	if(col != 4'b0000) begin
		digito <= aux;
		est <= estado;
		if(pulso == 2'd0) begin
			cambio_digito <= 1'd1;
			pulso <= 2'd1;
		end
		else begin
			cambio_digito <= 1'd0;
			pulso <= 2'd1;
		end
	end
	else begin
		digito <= digito;
		cambio_digito <= 1'd0;
		if(est == estado)
			pulso <= 2'd0;
	end
end


always @(*) begin
	case(estado)
		2'd0: begin
					fila<=fila_1;
					case(col)
						col_1: aux <= 5'd1;
						col_2: aux <= 5'd2;
						col_3: aux <= 5'd3;
						col_4: aux <= 5'hA;
						default: aux <= 5'd16;
					endcase
				 end
		2'd1: begin
					fila<=fila_2;
					case(col)
						col_1: aux <= 5'd4;
						col_2: aux <= 5'd5;
						col_3: aux <= 5'd6;
						col_4: aux <= 5'hB;
						default: aux <= 5'd16;
					endcase
				 end
		2'd2: begin
					fila<=fila_3;
					case(col)
						col_1: aux <= 5'd7;
						col_2: aux <= 5'd8;
						col_3: aux <= 5'd9;
						col_4: aux <= 5'hC;
						default: aux <= 5'd16;
					endcase
				 end
		2'd3: begin
					fila<=fila_4;
					case(col)
						col_1: aux <= 5'hF;
						col_2: aux <= 5'd0;
						col_3: aux <= 5'hE;
						col_4: aux <= 5'hD;
						default: aux <= 5'd16;
					endcase
				 end
		default: begin
					aux <= 5'd17;
				 end
	endcase
end

endmodule