module Filtro_Rebote (
	input clk, pulso_real,
	output reg pulso_ideal
);

reg [31:0] counter = 32'd0;
reg flag = 1'b0;

parameter duracion_ms = 32'd50; //Duracion en milisegundos del pulso 

always @(posedge clk, flag) begin

	if(flag) begin
		if(counter == (32'd50000*duracion_ms)) begin // 50000 = 1ms
			counter <= 32'd0;
			flag <= 1'b0; 
		end 
		else begin
			counter <= counter + 32'd1;
			flag <= 1'b1;
		end
	end
	else
		counter <= 32'd0;

end



always @(posedge pulso_real) begin
	flag <= 1'b1;
end

endmodule