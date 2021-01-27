module temporizador (
    input clk,
    input enter,
    input [4:0] R, G, B,
    output flag_R, flag_G, flag_B
);
parameter ciclos_max = 500_000; //ciclos
reg [4:0] ciclos_R, ciclos_G, ciclos_B;
reg [31:0] contador = 0;
reg [2:0] RBG_count = 0;       //indica que color se esta cargando

always @(posedge clk) begin
    if(B != 5'd16 )  begin       //Si ya pasaron los estados de lectura
        ciclos_R <= ciclos_max*R/15;
        ciclos_G <= ciclos_max*G/15;
        ciclos_B <= ciclos_max*B/15;
    end
end

always @(posedge clk) begin
    if(enter)
        start <= 1;
    else 
        start <= start;
end

always @(posedge clk) begin
    case (RGB_count)
        3'b001: begin
						 if(start)   contador <= contador + 1;
						 else contador <= contador; //=0
						 if(contador > ciclos_R) begin
							 RBG_count <= 3'b010;
							 contador <= 0;
							end
					 end
        3'b010: if(contador > ciclos_G) begin
                    RBG_count <= 3'b100;
                    contador <= 0;
                  end
                else contador <= contador + 1;
        3'b100: if(contador > ciclos_B) begin
                    start <= 0;
                    RBG_count <= 3'b001;
                    contador <= 0;
                end
                else contador <= contador + 1;
        default:  begin
                    start <= 0;
                    RBG_count <= 3'b001;
                    contador <= 0;
                  end  
    endcase
end


//Se activa la bandera cuando paso el tiempo de prendido de cada motor
//Duran un ciclo de clk en 1, despues los ifs de arriba resetean los contadores
assign flag_R = (contador_R >= ciclos_R);
assign flag_G = (contador_G >= ciclos_G);
assign flag_B = (contador_B >= ciclos_B);


endmodule