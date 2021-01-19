module temporizador (
    input clk,
    input enter,
    input [4:0] R, G, B,
    output flag_R, flag_G, flag_B
);
parameter ciclos_max = 500_000; //ciclos
reg [4:0] ciclos_R, ciclos_G, ciclos_B;
reg [31:0] contador = 0;
reg start = 0;

always @(posedge clk) begin
    if(B != 5'd16)  begin
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
    if(start) 
        contador <= contador + 1;
    else contador <= 0;

    if((contador >= ciclos_R) && (contador >= ciclos_R) && (contador >= ciclos_R))
        contador <= 0;

end

assign flag_R = (contador < ciclos_R);
assign flag_G = (contador < ciclos_G);
assign flag_B = (contador < ciclos_B);
/*
always @(posedge clk) begin
    contador <= contador + 1;
    if((contador >= ciclos_R) && (contador >= ciclos_R) && (contador >= ciclos_R))
        contador <= 0;
end

assign motor_R = (contador < ciclos_R);
assign motor_G = (contador < ciclos_G);
assign motor_B = (contador < ciclos_B);
*/


endmodule