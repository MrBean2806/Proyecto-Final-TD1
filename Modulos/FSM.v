module FSM(
    input clk,
    input reset,
    input RGB_full,
    input [2:0] flags,
    //input cambio,
    input enter,
    output reg [2:0] Motores
);
    parameter r = 2'd2, g = 2'd1, b = 2'd0;
    parameter lectura = 3'b0, espera = 3'b001,
              carga_R = 3'b011, carga_Y = 3'b100, carga_B = 3'b101;
    
    reg [2:0] estado, estado_pos = 0;

    always @ (posedge clk or negedge reset) begin
        if( !reset )
            estado <= lectura;
        else estado <= estado_pos;
    end

    always @ (*)   begin
        case(estado)
            lectura:    if(RGB_full) estado_pos = espera;
                        else estado_pos = estado;
            espera:     if(!RGB_full) estado_pos = lectura;
                        else if(enter)  estado_pos = carga_R;
                        else estado_pos = estado;
            carga_R:    if( flags[r] ) estado_pos = carga_Y;    else estado_pos = estado;
            carga_Y:    if( flags[g] ) estado_pos = carga_B;    else estado_pos = estado;
            carga_B:    if( flags[b] ) estado_pos = lectura;  else estado_pos = estado;
			default: 	estado_pos = lectura;
        endcase
    end

    always @ (*)   begin
        case (estado)
            // 5'd16 -> display en blanco
            // 5'd17 -> guion
            lectura: Motores = 3'b000;
            espera:    Motores = 3'b000;
            carga_R:   Motores = 3'b100;
            carga_Y:   Motores = 3'b010;
            carga_B:   Motores = 3'b001;
            default:   Motores = 3'b000;
        endcase
        
    end


endmodule