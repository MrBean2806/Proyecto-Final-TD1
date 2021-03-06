module Filtro_Rebote (
	input clk, pulso_real,
	output reg pulso_ideal = 1'b0 
);

reg [31:0] counter = 32'd0;

parameter duracion_ms = 32'd2000; //Duracion en milisegundos del pulso 

always @(posedge clk) begin

	if(pulso_ideal) begin
		if(counter >= (32'd50000*duracion_ms)) begin // 50000 = 1ms
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
			pulso_ideal = 1'b0;
	end
	
end

endmodule