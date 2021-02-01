module Drv_teclado(
	input clk,		//clk de 100Hz
	input [3:0] fila,
	input enter,
	output reg [3:0] col = 4'b0001,
	output reg [4:0] digito = 0,
	output reg [1:0] desp = 0
	output reg enter_sync
	//output reg cambio_digito;
);

reg [4:0] aux = 5'b10000;
reg [3:0] counter = 0;

//Cuando el bit de alguna posicion está en 1, significa q esa tecla esta presionada
parameter fila_1 = 4'b0001, col_1 = 4'b0001,
		  fila_2 = 4'b0010, col_2 = 4'b0010,
		  fila_3 = 4'b0100, col_3 = 4'b0100,
		  fila_4 = 4'b1000, col_4 = 4'b1000;

always @(posedge clk) begin
	enter_sync <= enter;
end

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
	begin
		col <= col <<< 1;
		if(col == 4'b1000)
			col <= 4'b0001;
	end

end

always @(fila, col, digito, aux) begin
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