// Divisor de frecuencia
module Clock_Divider(
    input clock_in,
    output clock_out
    );

	reg[27:0] contador = 28'd0;    //declaro el contador de 28 bits
	//parameter PERIODO
	parameter DIVISOR = 28'd2;      //parametro que indica por cuanto se divide la frecuencia del clock

	always @(posedge clock_in)
	begin
		      //actualizo el valor del contador en cada flanco positivo de clock_in
		if(contador >= (DIVISOR-1))          //cuando haya pasado una cantidad de ciclos igual a DIVISOR se resetea el contador
			contador <= 28'd0;
		else 
			contador <= contador + 28'd1; 
	end
	
	assign clock_out = (contador < DIVISOR/2) ? 1'b0 : 1'b1;

endmodule