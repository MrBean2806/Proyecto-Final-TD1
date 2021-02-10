`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:44:19 01/27/2021
// Design Name:   temporizador
// Module Name:   C:/Users/agusb/OneDrive/Escritorio/ISE_Projects/ProyectoFinal/test_temporizador.v
// Project Name:  ProyectoFinal
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: temporizador
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_temporizador;

	// Inputs
	reg clk;
	reg enter;
	reg [4:0] R;
	reg [4:0] G;
	reg [4:0] B;

	// Outputs
	wire flag_R;
	wire flag_G;
	wire flag_B;

	// Instantiate the Unit Under Test (UUT)
	temporizador uut (
		.clk(clk), 
		.enter(enter), 
		.R(R), 
		.G(G), 
		.B(B), 
		.flag_R(flag_R), 
		.flag_G(flag_G), 
		.flag_B(flag_B)
	);
	initial begin forever #5 clk = ~clk; end
	initial begin
		// Initialize Inputs
		clk = 0;
		enter = 0;
		R = 5'd5;
		G = 5'd10;
		B = 5'd15;

		// Wait 100 ns for global reset to finish
		#100;
        
		enter = 1;
		#100 enter = 0;

		
	end
      
endmodule

