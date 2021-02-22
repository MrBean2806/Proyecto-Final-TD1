`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:35:12 02/16/2021
// Design Name:   Drv_display
// Module Name:   C:/Users/agusb/OneDrive/Escritorio/ISE_Projects/ProyectoFinal/test_Drv_display.v
// Project Name:  ProyectoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Drv_display
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_Drv_display;

	// Inputs
	reg clk;
	reg [4:0] u;
	reg [4:0] d;
	reg [4:0] c;

	// Outputs
	wire [2:0] enable;
	wire [6:0] segmentos;

	// Instantiate the Unit Under Test (UUT)
	Drv_display uut (
		.clk(clk), 
		.u(u), 
		.d(d), 
		.c(c), 
		.enable(enable), 
		.segmentos(segmentos)
	);
	initial begin forever #10 clk = ~clk; end
	initial begin
		// Initialize Inputs
		clk = 0;
		u = 0;
		d = 0;
		c = 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		fork
			begin
				u = 5'h1;	//b0110000
				d = 5'h3;	//b1111001
				c = 5'hE;	//b1001111
			end
		join
		
		#100 u = 5'h9;
		#20  d = 5'hA;
		#40  c = 5'hD;
		
		
	end
      
endmodule

