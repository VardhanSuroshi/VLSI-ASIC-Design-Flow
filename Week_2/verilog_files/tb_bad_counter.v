
`timescale 1ns / 1ps
module tb_bad_counter;
	// Inputs
	reg clk, reset   ;
	// Output
	wire [1:0] cnt;

        // Instantiate the Unit Under Test (UUT)
	bad_counter uut (
		.clk(clk),
		.reset(reset),
		.cnt(cnt)
	);

	initial begin
	$dumpfile("tb_bad_counter.vcd");
	$dumpvars(0,tb_bad_counter);
	// Initialize Inputs
	clk = 0;
	reset = 1;
	#3000 $finish;
	end

always #10 clk = ~clk;
always #1547 reset=~reset;
endmodule


