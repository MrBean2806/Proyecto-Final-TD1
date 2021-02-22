`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:52:53 02/22/2021
// Design Name:   Driver_teclado
// Module Name:   C:/Users/agusb/OneDrive/Escritorio/ISE_Projects/ProyectoFinal/test_driver_teclado.v
// Project Name:  ProyectoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Driver_teclado
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_driver_teclado;

	// Inputs
	reg clk;
	reg [3:0] fila;

	// Outputs
	wire [3:0] col;
	wire [4:0] digito;
	wire cambio_digito;

	// Instantiate the Unit Under Test (UUT)
	Driver_teclado uut (
		.clk(clk), 
		.fila(fila), 
		.col(col), 
		.digito(digito), 
		.cambio_digito(cambio_digito)
	);

	initial begin forever #10 clk = ~clk; end
	initial begin
		clk = 0;
		fila = 0;
		#60

		//Escribo un 1
		fila = 4'b0001;
		#20
		fila = 4'b0;
		
		//Escribo un 2
		#60
		fila = 4'b0010;
		#20
		fila = 4'b0;
		
		//Escribo un 
		#60
		fila = 4'b0100;
		#20
		fila = 4'b0;
		
		#80
		fila = 4'b0001;
		#20
		fila = 4'b0;

	end
      
endmodule

