
`timescale 1ns / 1ps
module tb_dff_syncres;
	// Inputs
	reg clk,  sync_reset,  d;
	// Outputs
	wire q;

        // Instantiate the Unit Under Test (UUT)
	dff_syncres uut (
		.clk(clk),
		.sync_reset(sync_reset),
		.d(d),
		.q(q)
	);

	initial begin
	$dumpfile("tb_dff_syncres.vcd");
	$dumpvars(0,tb_dff_syncres);
	// Initialize Inputs
	clk = 0;
	sync_reset = 0;
	d = 0;
	#3000 $finish;
	end

always #10 clk = ~clk;
always #23 d = ~d;
always #113 sync_reset = ~sync_reset;
endmodule

