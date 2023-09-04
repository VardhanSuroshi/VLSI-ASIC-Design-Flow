
`timescale 1ns / 1ps
module tb_demux_case;
	// Inputs
	reg i;
	reg [2:0] sel;
	
	//TB Signals
	reg clk,reset;

	// Outputs
	wire o7,o6,o5,o4,o3,o2,o1,o0;

        // Instantiate the Unit Under Test (UUT)
	demux_case uut (
		.sel(sel),
		.o0(o0),
		.o1(o1),
		.o2(o2),
		.o3(o3),
		.o4(o4),
		.o5(o5),
		.o6(o6),
		.o7(o7),
		.i(i)
	);

	initial begin
	$dumpfile("tb_demux_case.vcd");
	$dumpvars(0,tb_demux_case);
	// Initialize Inputs
	i = 1'b0;
	clk = 1'b0;
	reset = 1'b0 ;  #1;
	reset = 1'b1 ;  #10;
	reset = 1'b0;

	#3900 $finish;
	end

always #17 i = ~i;
always #300 clk = ~clk;

always @ (posedge clk , posedge reset)
begin
	if(reset)
		sel <= 3'b000;
	else
		sel <= sel + 1;
end



endmodule


