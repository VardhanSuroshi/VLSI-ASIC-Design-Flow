`timescale 1ns / 1ps
module tb_ripple_counter;
	// Inputs
	reg clk, reset   ;
	// Output
	wire [1:0] q;

        // Instantiate the Unit Under Test (UUT)
	ripple_counter uut (
		.clk(clk),
		.reset(reset),
		.q(q)
	);

	initial begin
	$dumpfile("tb_ripple_counter.vcd");
	$dumpvars(0,tb_ripple_counter);
	// Initialize Inputs
	clk = 0;
	reset = 1;
	#3000 $finish;
	end

always #10 clk = ~clk;
always #1547 reset=~reset;
endmodule
