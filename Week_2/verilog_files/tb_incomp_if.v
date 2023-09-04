


`timescale 1ns / 1ps
module tb_incomp_if;
	//input
	reg i0,i1,i2;
	// Output
	wire y;

        // Instantiate the Unit Under Test (UUT)
	incomp_if uut (
		.i0(i0),
		.i1(i1),
		.i2(i2),
		.y(y)
	);

	initial begin
	$dumpfile("tb_incomp_if.vcd");
	$dumpvars(0,tb_incomp_if);
	// Initialize Inputs
	i0 = 1'b0;
	i1 = 1'b0;
	i2 = 1'b0;
	
	#3000 $finish;
	end

always #317 i0 = ~i0;
always #37 i1 = ~i1;
always #57 i2 = ~i2;

endmodule

