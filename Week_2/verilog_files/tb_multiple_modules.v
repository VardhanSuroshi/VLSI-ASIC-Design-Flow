


`timescale 1ns / 1ps
module tb_multiple_modules;
	// Inputs
	reg a,b,c;
	// Outputs
	wire y;

        // Instantiate the Unit Under Test (UUT)
	multiple_modules uut (
		.a(a),
		.b(b),
		.c(c),
		.y(y)
	);

	initial begin
	$dumpfile("tb_multiple_modules.vcd");
	$dumpvars(0,tb_multiple_modules);
	// Initialize Inputs
	a = 0;
	b = 0;
	c = 0;
	#300 $finish;
	end

always #10 a = ~a;
always #55 b = ~b;
always #75 c = ~c;
endmodule


