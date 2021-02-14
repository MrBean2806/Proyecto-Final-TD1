module temporizador (
    input clk,  //si T=400ms, el t_max es 6 seg 
    input enter,
    input [4:0] ciclos_R, ciclos_G, ciclos_B,
    output [2:0] flags
);
    parameter r = 2'd2, g = 2'd1, b = 2'd0;
    parameter start = 2'b00, R_count = 2'b01, G_count = 2'b11, B_count = 2'b10; 

    //reg [4:0] ciclos_R, ciclos_G, ciclos_B;
    reg [3:0] contador = 0;			
    reg [1:0] RGB_count = 0;       //indica que color se esta cargando

    //wire [4:0] ciclos_R, ciclos_G, ciclos_B;

    /*initial begin
    #10 $display("tiempo   contador    flags");
        $monitor("(%6d)     %d         %b%b%b", $time, contador, flags[r], flags[g], flags[b]);
    end
    */

    always @(posedge clk) begin
        //RGB_count indica que color se esta cargando, va pasando secuencialmente entre colores
        case (RGB_count)
            start: begin
                        if(enter)   RGB_count <= R_count; 
                        else        RGB_count <= RGB_count; //hace falta?
                    end
            R_count: begin      //carga rojo
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
    //initial begin
    //    $monitor("flags = %b%b%b", flags[r], flags[g], flags[b]);
    //end

    //Se activa la bandera cuando paso el tiempo de prendido de cada motor
    //Duran un ciclo de clk en 1, despues los ifs de arriba resetean los contadores
    assign flags[r] = (contador >= ciclos_R);
    assign flags[g] = (contador >= ciclos_G);
    assign flags[b] = (contador >= ciclos_B);


endmodule

