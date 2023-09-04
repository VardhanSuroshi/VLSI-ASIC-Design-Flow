


`timescale 1ns / 1ps
module tb_incomp_if2;
	//input
	reg i0,i1,i2,i3;
	// Output
	wire y;

        // Instantiate the Unit Under Test (UUT)
	incomp_if2 uut (
		.i0(i0),
		.i1(i1),
		.i2(i2),
		.i3(i3),
		.y(y)
	);

	initial begin
	$dumpfile("tb_incomp_if2.vcd");
	$dumpvars(0,tb_incomp_if2);
	// Initialize Inputs
	i0 = 1'b0;
	i1 = 1'b0;
	i2 = 1'b0;
	i3 = 1'b0;
	
	#3000 $finish;
	end

always #317 i0 = ~i0;
always #37 i1 = ~i1;
always #157 i2 = ~i2;
always #67 i3 = ~i3;

endmodule


