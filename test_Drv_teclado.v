`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:16:32 01/19/2021
// Design Name:   Drv_teclado
// Module Name:   C:/Users/agusb/OneDrive/Escritorio/ISE_Projects/ProyectoFinal/test_Drv_teclado.v
// Project Name:  ProyectoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Drv_teclado
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_Drv_teclado;

	// Inputs
	reg clk;
	reg [3:0] fila;

	// Outputs
	wire [3:0] col;
	wire [4:0] digito;
	wire [1:0] desp;

	// Instantiate the Unit Under Test (UUT)
	Drv_teclado uut (
		.clk(clk), 
		.fila(fila), 
		.col(col), 
		.digito(digito), 
		.desp(desp)
	);
	initial begin forever #5 clk = ~clk; end
	initial begin
		// Initialize Inputs
		clk = 0;
		fila = 0;
		
		// Wait 100 ns for global reset to finish
		#100;      

		
		fila = 4'b0001;
		#10
		fila = 4'b0;
		
		#40
		fila = 4'b0010;
		#10
		fila = 4'b0;
		
		#40
		fila = 4'b0100;
		#10
		fila = 4'b0;
		
		#40
		fila = 4'b1000;
		#10
		fila = 4'b0;
		// Add stimulus here

	end
      
endmodule

