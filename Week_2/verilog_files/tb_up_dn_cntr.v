`timescale 1ns / 1ps
module tb_up_dn_cntr;
	// Inputs
	reg clk, reset, up_dnb;
	// Outputs
	wire [3:0] cnt;

        // Instantiate the Unit Under Test (UUT)
	up_dn_cntr uut (
		.clk(clk),
		.reset(reset),
		.up_dnb(up_dnb),
		.cnt(cnt)
	);

	initial begin
	$dumpfile("tb_up_dn_cntr.vcd");
	$dumpvars(0,tb_up_dn_cntr);
	// Initialize Inputs
	clk = 0;
	reset = 1;
	up_dnb = 1;
	#3000 $finish;
	end

always #10 clk = ~clk;
always #501 up_dnb = ~up_dnb;
always #123 reset=0;
endmodule
