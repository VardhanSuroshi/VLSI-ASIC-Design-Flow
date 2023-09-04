
`timescale 1ns / 1ps
module tb_dff_asyncres;
	// Inputs
	reg clk, async_reset,   d;
	// Outputs
	wire q;

        // Instantiate the Unit Under Test (UUT)
	dff_asyncres uut (
		.clk(clk),
		.async_reset(async_reset),
		.d(d),
		.q(q)
	);

	initial begin
	$dumpfile("tb_dff_asyncres.vcd");
	$dumpvars(0,tb_dff_asyncres);
	// Initialize Inputs
	clk = 0;
	async_reset = 1;
	d = 0;
	#3000 $finish;
	end

always #10 clk = ~clk;
always #23 d = ~d;
always #547 async_reset=~async_reset;
endmodule

