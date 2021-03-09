module Temporizador (
    input clk,reset,  //si T=400ms, el t_max es 6 seg 
    input trigger,
    input [4:0] ciclos_R, ciclos_G, ciclos_B,
    output reg [2:0] flags
);
    parameter r = 2'd2, g = 2'd1, b = 2'd0;
    parameter start = 2'b00, R_count = 2'b01, G_count = 2'b11, B_count = 2'b10; 

    reg [3:0] contador = 4'd0;			
    reg [1:0] RGB_count = 2'd0;       //indica que color se esta cargando

    always @(posedge clk, negedge reset) begin
		if(!reset)
			RGB_count <= start;
		else begin
        //RGB_count indica que color se esta cargando, va pasando secuencialmente entre colores
        case (RGB_count)
            start: begin
								flags <= 3'd0;
                        if(trigger)   RGB_count <= R_count; 
                        else        RGB_count <= start; //hace falta?
                    end
            R_count: begin      //carga rojo
                        if(contador >= ciclos_R) begin
                            RGB_count <= G_count;    //paso al sig color
									 flags <= 3'b100;
                            contador <= 4'd0;          
                        end
                        else begin contador <= contador + 4'd1;end
                    end
            G_count: begin 
								if(contador >= ciclos_G) begin
									RGB_count <= B_count;
									flags <= 3'b010;
									contador <= 4'd0;
								end
								else begin contador <= contador + 4'd1;end
						  end
            B_count: begin
								if(contador >= ciclos_B) begin
									RGB_count <= start;
									flags <= 3'b001;
									contador <= 4'd0;
							   end
								else begin contador <= contador + 4'd1; end
							end
            //no hace falta el default pq estan incluidos todos los valores de RGB_count
        endcase
      end
    end
    //Se activa la bandera cuando paso el tiempo de prendido de cada motor
//    //Duran un ciclo de clk en 1, despues los ifs de arriba resetean los contadores
//    assign flags[r] = (contador >= ciclos_R);
//    assign flags[g] = (contador >= ciclos_G);
//    assign flags[b] = (contador >= ciclos_B);


endmodule

