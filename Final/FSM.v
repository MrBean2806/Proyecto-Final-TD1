module FSM(
    input clk,
    input reset,
    input RGB_full,
    input [2:0] flags,
    input enter,
    output reg [2:0] Motores = 3'd0,
	 output reg trigger = 1'd0,
	 output [2:0] est 
);
    parameter r = 2'd2, g = 2'd1, b = 2'd0;
    parameter lectura = 3'b0, espera = 3'b001,
              carga_R = 3'b011, carga_Y = 3'b100, carga_B = 3'b101;
    
    reg [2:0] estado, estado_pos = 3'd0;

    always @ (posedge clk, negedge reset) begin
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
                        else estado_pos = espera;
            carga_R:    if( flags[r] ) estado_pos = carga_Y;    else estado_pos = carga_R;
            carga_Y:    if( flags[g] ) estado_pos = carga_B;    else estado_pos = carga_Y;
            carga_B:    if( flags[b] ) estado_pos = lectura;  else estado_pos = carga_B;
			default: 	estado_pos = lectura;
        endcase
    end

    always @ (*)   begin
        case (estado)
            // 5'd16 -> display en blanco
            // 5'd17 -> guion
            lectura: begin  Motores = 3'b000; trigger = 1'd0; end
            espera:  begin  Motores = 3'b000; trigger = 1'd0; end
            carga_R: begin  Motores = 3'b100; trigger = 1'd1; end
            carga_Y: begin  Motores = 3'b010; trigger = 1'd0; end
            carga_B: begin  Motores = 3'b001; trigger = 1'd0; end
            default: begin  Motores = 3'b000; trigger = 1'd0; end
				
        endcase
        
    end
assign est = estado;

endmodule