	module temporizador (
    input clk,
    input enter,
    input [4:0] R, G, B,
    output flag_R, flag_G, flag_B
);
parameter R_count = 2'b01, G_count = 2'b10, B_count = 2'b11, start = 2'b00; 

reg [4:0] ciclos_R, ciclos_G, ciclos_B;	//hay q agrandarlo en funcion de ciclo_unitario pq la multiplicacion puede dar valores grandes
reg [3:0] contador = 0;				//cuenta solo hasta 15
reg [1:0] RGB_count = 0;       //indica que color se esta cargando

always @(posedge clk) begin
    if( B != 5'd16 /* && start*/)  begin       //Si ya pasaron los estados de lectura
        ciclos_R <= R;
        ciclos_G <= G;
        ciclos_B <= B;
	 end
end

/*always @(posedge clk) begin
    //no se si hace falta start
    begin
		 if(enter)
			  start <= 1;
		 else 
			  start <= start;
		end
end
	*/	

always @(posedge clk) begin
	 case (RGB_count)
        //agregarle shift aritmetico
        start: begin
                    if(enter)   RGB_count <= R_count; 
                    else        RGB_count <= RGB_count; //hace falta?
                end
        R_count: begin
                    if(contador >= ciclos_R) begin
                        RGB_count <= G_count;    //paso al sig color
                        contador <= 0;          
                    end
                    else contador <= contador + 1;
                end
        G_count: if(contador >= ciclos_G) begin
                    RGB_count <= B_count;
                    contador <= 0;
                  end
                else contador <= contador + 1;
        B_count: if(contador >= ciclos_B) begin
                    //start <= 0;
                    RGB_count <= start;
                    contador <= 0;
                end
                else contador <= contador + 1;
        //no hace falta el default pq estan incluidos todos los valores de RGB_count
    endcase
end


//Se activa la bandera cuando paso el tiempo de prendido de cada motor
//Duran un ciclo de clk en 1, despues los ifs de arriba resetean los contadores
assign flag_R = (contador >= ciclos_R);
assign flag_G = (contador >= ciclos_G);
assign flag_B = (contador >= ciclos_B);


endmodule