module Driver_teclado(
	input clk,		//clk de 100Hz
	input [3:0] fila,
	output reg[3:0] col,
	output reg [4:0] digito = 5'd16,
	output reg cambio_digito = 0
);

 
reg [4:0] aux = 5'd16;
reg [1:0] estado = 2'd0;

parameter fila_1 = 4'b0001, col_1 = 4'b0001,
		  fila_2 = 4'b0010, col_2 = 4'b0010,
		  fila_3 = 4'b0100, col_3 = 4'b0100,
		  fila_4 = 4'b1000, col_4 = 4'b1000;

always @(posedge clk) begin
	begin
		if(estado >= 2'b11)
			estado <= 2'd0;
		else
			estado <= estado + 2'd1;
	end
end

always@(posedge clk) begin
	//no hay teclas apretadas
	if(fila == 4'b0000) begin
		digito <= digito;
		cambio_digito <= 1'd1;
	end
	else begin
		digito <= aux;
		cambio_digito <= 1'd0;
	end
end


always @(*) begin
	case(estado)
		2'd0: begin
					col<=col_1;
					case(fila)
						fila_1: aux <= 5'd1;
						fila_2: aux <= 5'd4;
						fila_3: aux <= 5'd7;
						fila_4: aux <= 5'hF;
						default: aux <= 5'd16;
					endcase
				 end
		2'd1: begin
					col<=col_2;
					case(fila)
						fila_1: aux <= 5'd2;
						fila_2: aux <= 5'd5;
						fila_3: aux <= 5'd8;
						fila_4: aux <= 5'd0;
						default: aux <= 5'd16;
					endcase
				 end
		2'd2: begin
					col<=col_3;
					case(fila)
						fila_1: aux <= 5'd3;
						fila_2: aux <= 5'd6;
						fila_3: aux <= 5'd9;
						fila_4: aux <= 5'hE;
						default: aux <= 5'd16;
					endcase
				 end
		2'd3: begin
					col<=col_4;
					case(fila)
						fila_1: aux <= 5'hA;
						fila_2: aux <= 5'hB;
						fila_3: aux <= 5'hC;
						fila_4: aux <= 5'hD;
						default: aux <= 5'd16;
					endcase
				 end
		default: begin
					aux <= 5'd17;
				 end
	endcase
end

endmodule