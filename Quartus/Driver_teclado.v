module Driver_teclado(
	input clk,		//clk de 100Hz
	input [3:0] fila,
	output reg [3:0] col = 4'b0001,
	output reg [4:0] digito = 5'd16,
	output reg cambio_digito
);
reg [4:0] aux = 5'b10000;
//reg [3:0] counter = 0;

//Cuando el bit de alguna posicion está en 1, significa q esa tecla esta presionada
parameter fila_1 = 4'b0001, col_1 = 4'b0001,
		  fila_2 = 4'b0010, col_2 = 4'b0010,
		  fila_3 = 4'b0100, col_3 = 4'b0100,
		  fila_4 = 4'b1000, col_4 = 4'b1000;

always @(posedge clk) begin
	if(col == 4'b1000)
		col <= 4'b0001;
	else
		col <= col <<< 1;
end

always @(posedge clk) begin
	//no hay teclas apretadas
	if(fila == 4'd0) begin
		digito <= digito;
		cambio_digito <= 1'b0;
	end
	else begin
		digito <= aux;
		cambio_digito <= 1'b1;
	end
end

always @(fila, col) begin
	case(col)
		col_1: begin
					case(fila)
						fila_1: aux <= 5'd1;
						fila_2: aux <= 5'd4;
						fila_3: aux <= 5'd7;
						fila_4: aux <= 5'hF;
						default: aux <= 5'd16;
					endcase
				 end
		col_2: begin
					case(fila)
						fila_1: aux <= 5'd2;
						fila_2: aux <= 5'd5;
						fila_3: aux <= 5'd8;
						fila_4: aux <= 5'd0;
						default: aux <= 5'd16;
					endcase
				 end
		col_3: begin
					case(fila)
						fila_1: aux <= 5'd3;
						fila_2: aux <= 5'd6;
						fila_3: aux <= 5'd9;
						fila_4: aux <= 5'hE;
						default: aux <= 5'd16;
					endcase
				 end
		col_4: begin
					case(fila)
						fila_1: aux <= 5'hA;
						fila_2: aux <= 5'hB;
						fila_3: aux <= 5'hC;
						fila_4: aux <= 5'hD;
						default: aux <= 5'd16;
					endcase
				 end
		default: begin
					aux <= 5'b10001;
				 end
	endcase
end

endmodule