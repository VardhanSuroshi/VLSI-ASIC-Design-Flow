`timescale 1ns / 1ps
module tb_dff_asyncres_syncres;
	// Inputs
	reg clk, async_reset, sync_reset,  d;
	// Outputs
	wire q;

        // Instantiate the Unit Under Test (UUT)
	dff_asyncres_syncres uut (
		.clk(clk),
		.async_reset(async_reset),
		.sync_reset(sync_reset),
		.d(d),
		.q(q)
	);

	initial begin
	$dumpfile("tb_dff_asyncres_syncres.vcd");
	$dumpvars(0,tb_dff_asyncres_syncres);
	// Initialize Inputs
	clk = 0;
	async_reset = 1;
	sync_reset = 0;
	d = 0;
	#3000 $finish;
	end

always #10 clk = ~clk;
always #23 d = ~d;
always #113 sync_reset = ~sync_reset;
always #547 async_reset=~async_reset;
endmodule

