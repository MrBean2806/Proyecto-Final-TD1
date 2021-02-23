`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:03:50 02/06/2021
// Design Name:   Top
// Module Name:   C:/Users/agusb/OneDrive/Escritorio/ISE_Projects/ProyectoFinal/test_top.v
// Project Name:  ProyectoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_top;

	// Inputs
	reg clk;
	reg enter;
	reg reset;
	reg [3:0] fila;

	// Outputs
	wire [3:0] col;
	wire [6:0] segmentos;
	wire [2:0] enable;
	wire [2:0] Motores;

	// Instantiate the Unit Under Test (UUT)
	Top uut (
		.clk(clk), 
		.enter(enter), 
		.reset(reset), 
		.fila(fila), 
		.col(col), 
		.segmentos(segmentos), 
		.enable(enable), 
		.Motores(Motores)
	);
	initial begin forever #10 clk = ~clk; end		//f = 50MHz
	initial begin
		// Initialize Inputs
		clk = 0;
		enter = 0;
		reset = 1;	
		fila = 0;
		#20
		
	//Escribo un 2
		fila = 4'b0001;
		#20
		fila = 4'b0;
	//Escribo un 5	
		#60
		fila = 4'b0010;
		#20
		fila = 4'b0;
	//Escribo un 8
		#60
		fila = 4'b0100;
		#20
		fila = 4'b0;
	//Aprieto el enter para empezar la carga
		#160
		enter = 1;
		#20 enter = 0;
	
		#1000
		
	//Escribo 4 digitos seguidos para que se resetee el display
		#60
		fila = 4'b0001;
		#20
		fila = 4'b0;

		#60
		fila = 4'b0001;
		#20
		fila = 4'b0;
		
		#60
		fila = 4'b0001;
		#20
		fila = 4'b0;
		
		#60
		fila = 4'b0001;
		#20
		fila = 4'b0;
		


		
	end
      
endmodule

