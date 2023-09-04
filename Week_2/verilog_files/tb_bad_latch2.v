`timescale 1ns / 1ps
module tb_bad_latch;
	// Inputs
	reg clk, reset, d;
	// Outputs
	wire q;

        // Instantiate the Unit Under Test (UUT)
	bad_latch uut (
		.clk(clk),
		.reset(reset),
		.d(d),
		.q(q)
	);

	initial begin
	$dumpfile("tb_bad_latch.vcd");
	$dumpvars(0,tb_bad_latch);
	// Initialize Inputs
	clk = 0;
	reset = 1;
	d = 0;
	#300 $finish;
	end

always #20 clk = ~clk;
always #23 d = ~d;
always #15 reset=0;
endmodule

