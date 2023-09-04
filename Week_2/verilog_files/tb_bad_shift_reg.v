`timescale 1ns / 1ps
module tb_bad_shift_reg;
	// Inputs
	reg clk, reset,   d;
	// Outputs
	wire dout;

        // Instantiate the Unit Under Test (UUT)
	bad_shift_reg uut (
		.clk(clk),
		.reset(reset),
		.d(d),
		.dout(dout)
	);

	initial begin
	$dumpfile("tb_bad_shift_reg.vcd");
	$dumpvars(0,tb_bad_shift_reg);
	// Initialize Inputs
	clk = 0;
	reset = 1;
	d = 0;
	#3000 $finish;
	end

always #10 clk = ~clk;
always #173 d = ~d;
always #123 reset=0;
endmodule

