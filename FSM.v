module FSM(
    input clk,
    input reset,
    input [4:0] digito,
    input cambio,
    input enter,
    output reg [14:0] RYB,
    output reg [2:0] Motores
)
    parameter lectura_R = 3'b0, lectura_Y = 3'b001, lectura_B = 3'b010,
              carga_R = 3'b011, carga_Y = 3'b100, carga_B = 3'b101, espera = 3'b110;
    reg [2:0] estado, estado_pos;
    reg [32:0] t_R, t_Y, t_B;

    always @ (posedge clk or negedge rst) begin
        if( !rst )
            estado <= lectura_R;
        else estado <= estado_pos;
    end

    always @ (estado)   begin
        case(estado)
            lectura_R:  if(cambio) estado_pos = lectura_Y;
                        else estado_pos = estado_pos;
            lectura_Y:  if(!cambio) estado_pos = lectura_B;
                        else estado_pos = estado_pos;
            lectura_B:  if(cambio) estado_pos = espera;
                        else estado_pos = estado_pos;
            espera:     if(!cambio) estado_pos = lectura_R;
                        else if(enter)  estado_pos = carga_R;
                        else estado_pos = estado_pos;
            carga_R:    if(t_R) estado_pos = carga_Y    else estado_pos = estado_pos;
            carga_Y:    if(t_Y) estado_pos = carga_B    else estado_pos = estado_pos;
            carga_B:    if(t_B) estado_pos = lectura_R  else estado_pos = estado_pos;
        endcase
    end

    always @ (estado)   begin
        case (estado)
            // 5'd16 -> display en blanco
            // 5'd17 -> guion
            lectura_R:  begin   Motores = 3'b000;   RYB =  15'b10000_10000_10000;   end
            lectura_Y:  begin Motores = 3'b000;   RYB = {digito, RYB[9:0]}; end
            lectura_B:  begin Motores = 3'b000; RYB = {RYB[14:10], digito, RYB[4:0]};    end
            espera:     begin Motores = 3'b000; RYB = {RYB[14:5], digito};    end
            carga_R:    begin Motores = 3'b100; RYB = {5'd17, 5'd16, 5'd16};   end
            carga_Y:    begin Motores = 3'b010; RYB = {5'd16, 5'd17, 5'd16};    end
            carga_B:    begin Motores = 3'b001; RYB = {5'd16, 5'd16, 5'd17};    end
            default: 
        endcase
        
    end


endmodule