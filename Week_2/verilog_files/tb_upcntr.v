`timescale 1ns / 1ps
module tb_upcntr;
	// Inputs
	reg clk, reset;
	// Outputs
	wire [3:0] cnt;

        // Instantiate the Unit Under Test (UUT)
	upcntr uut (
		.clk(clk),
		.reset(reset),
		.cnt(cnt)
	);

	initial begin
	$dumpfile("tb_upcntr.vcd");
	$dumpvars(0,tb_upcntr);
	// Initialize Inputs
	clk = 0;
	reset = 1;
	#3000 $finish;
	end

always #10 clk = ~clk;
always #123 reset=0;
endmodule
