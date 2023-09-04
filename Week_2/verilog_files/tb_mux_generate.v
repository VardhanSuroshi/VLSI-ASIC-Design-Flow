`timescale 1ns / 1ps
module tb_mux_generate;
	// Inputs
	reg i0,i1;
	reg i2,i3;
	reg [1:0] sel;
	
	//TB Signals
	reg clk,reset;

	// Outputs
	wire y;

        // Instantiate the Unit Under Test (UUT)
	mux_generate uut (
		.sel(sel),
		.i0(i0),
		.i1(i1),
		.i2(i2),
		.i3(i3),
		.y(y)
	);

	initial begin
	$dumpfile("tb_mux_generate.vcd");
	$dumpvars(0,tb_mux_generate);
	// Initialize Inputs
	i0 = 1'b0;
	i1 = 1'b0;
	i2 = 1'b0;
	i3 = 1'b0;
	clk = 1'b0;
	reset = 1'b0 ;  #1;
	reset = 1'b1 ;  #10;
	reset = 1'b0;

	#3000 $finish;
	end

always #17 i0 = ~i0;
always #37 i1 = ~i1;
always #88 i2 = ~i2;
always #155 i3 = ~i3;
always #300 clk = ~clk;

always @ (posedge clk , posedge reset)
begin
	if(reset)
		sel <= 2'b00;
	else
		sel <= sel + 1;
end



endmodule


