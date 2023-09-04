

`timescale 1ns / 1ps
module tb_opt_check3;
	// Inputs
	reg a,b,c;
	// Outputs
	wire y;

        // Instantiate the Unit Under Test (UUT)
	opt_check3 uut (
		.a(a),
		.b(b),
		.c(c),
		.y(y)
	);

	initial begin
	$dumpfile("tb_opt_check3.vcd");
	$dumpvars(0,tb_opt_check3);
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


