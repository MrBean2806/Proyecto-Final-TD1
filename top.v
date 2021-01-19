module Top(
    input
    output
);


teclado teclado(.clk(clk), .enter(enter), .fila(fila), .col(col),
                .digito(digito), . desp(desp));
FSM fsm(.clk(clk), .digito(digito));
Mux_Refresh();



endmodule