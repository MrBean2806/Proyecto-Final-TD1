`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:55:15 02/11/2021
// Design Name:   Memoria_RGB
// Module Name:   C:/Users/agusb/OneDrive/Escritorio/ISE_Projects/borrar/test_MemoriaRGB.v
// Project Name:  borrar
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Memoria_RGB
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_MemoriaRGB;

	// Inputs
	reg clk;
	reg reset;
	reg [4:0] digito;
	reg cambio_digito;

	// Outputs
	wire [4:0] u;
	wire [4:0] d;
	wire [4:0] c;
	wire RGB_full;

	// Instantiate the Unit Under Test (UUT)
	Memoria_RGB uut (
		.clk(clk),
		.reset(reset),
		.digito(digito), 
		.cambio_digito(cambio_digito), 
		.u(u), 
		.d(d), 
		.c(c), 
		.RGB_full(RGB_full)
	);
	initial begin forever #5 clk = ~clk; end 
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		digito = 0;
		cambio_digito = 0;

		// Wait 100 ns for global reset to finish
		#105;
      //Escribo R
		fork
			begin
				digito = 5'h1;
				cambio_digito = 1;
			end
		join
		#10 cambio_digito = 0;
		#30
	//Escribo G
		fork
			begin
				digito = 5'hF;
				cambio_digito = 1;
			end
		join
		#10 cambio_digito = 0;
	
	//Pruebo el reset
		#20
		reset = 0;
		#10 reset = 1;
	
	//Escribo un 9
		fork
			begin
				digito = 5'h9;
				cambio_digito = 1;
			end
		join
		#10 cambio_digito = 0;
		
		#30
	//Escribo una A	
		fork
			begin
				digito = 5'hA;
				cambio_digito = 1;
			end
		join
		#10 cambio_digito = 0;
		#30
	//Escribo una A	
		fork
			begin
				digito = 5'hA;
				cambio_digito = 1;
			end
		join
		#10 cambio_digito = 0;
		#30
	//Escribo una A para hacer q se resetee el display	
		fork
			begin
				digito = 5'hA;
				cambio_digito = 1;
			end
		join
		#10 cambio_digito = 0;
		
		
	end
      
endmodule

