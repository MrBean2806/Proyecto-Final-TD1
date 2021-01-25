module temporizador (
    input clk,
    input enter,
    input [4:0] R, G, B,
    output flag_R, flag_G, flag_B
);
parameter ciclos_max = 500_000; //ciclos
reg [4:0] ciclos_R, ciclos_G, ciclos_B;
reg [31:0] contador_R, contador_G, contador_B = 0;
reg start = 0;

always @(posedge clk) begin
    if(B != 5'd16 )  begin       //Si ya pasaron los estados de lectura
        ciclos_R <= ciclos_max*R/15;
        ciclos_G <= ciclos_max*G/15;
        ciclos_B <= ciclos_max*B/15;
    end
end
//Empieza a contar si se apreto el enter
always @(posedge clk) begin
    if(enter)
        start <= 1;
    else 
        start <= start;
end

always @(posedge clk) begin
    if(start) begin
        contador_R <= contador_R + 1;
        contador_G <= contador_G + 1;
        contador_B <= contador_B + 1;
    end
    else begin
        contador_R <= 0;
        contador_G <= 0;
        contador_B <= 0;
    end  

    if(contador_R > ciclos_R) begin
        contador_R <= 0;
        start <= 0;
    end
    if(contador_G > ciclos_G) begin
        contador_G <= 0;
        start <= 0;
    end
    if(contador_B > ciclos_B) begin
        contador_B <= 0;
        start <= 0;
    end
end

//Se activa la bandera cuando paso el tiempo de prendido de cada motor
//Duran un ciclo de clk en 1, despues los ifs de arriba resetean los contadores
assign flag_R = (contador_R >= ciclos_R);
assign flag_G = (contador_G >= ciclos_G);
assign flag_B = (contador_B >= ciclos_B);


endmodule