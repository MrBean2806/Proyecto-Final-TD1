module Filtro_Rebote (
	input clk, pulso_real,
	output reg pulso_ideal = 1'b0 
);

reg [31:0] counter = 32'd0;

parameter duracion_ms = 32'd2; //Duracion en milisegundos del pulso 

always @(posedge clk) begin

	if(pulso_ideal) begin
		if(counter == 32'd4) begin // 50000 = 1ms
			counter = 32'd0;
			pulso_ideal = 1'b0; 
		end 
		else begin
			counter = counter + 32'd1;
			pulso_ideal = 1'b1;
		end
	end
	else begin
		counter = 32'd0;
		
		if(pulso_real)
			pulso_ideal = 1'b1;
		else
			pulso_ideal = pulso_ideal;
	end
end

endmodule