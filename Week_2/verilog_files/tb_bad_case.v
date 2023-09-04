

`timescale 1ns / 1ps
module tb_bad_case;
	// TB_SIGNALS
	reg clk, reset   ;
	//input
	reg i0,i1,i2,i3;
	reg [1:0] sel;
	// Output
	wire y;

        // Instantiate the Unit Under Test (UUT)
	bad_case uut (
		.i0(i0),
		.i1(i1),
		.i2(i2),
		.i3(i3),
		.sel(sel),
		.y(y)
	);

	initial begin
	$dumpfile("tb_bad_case.vcd");
	$dumpvars(0,tb_bad_case);
	// Initialize Inputs
	clk = 0;
	i0 = 1'b0;
	i1 = 1'b0;
	i2 = 1'b0;
	i3 = 1'b0 ;
	reset = 1'b0; #1;
	reset = 1'b1; #10;
	reset = 1'b0; 
	
	#3000 $finish;
	end

always #200 clk = ~clk;
always #17 i0 = ~i0;
always #37 i1 = ~i1;
always #57 i2 = ~i2;
always #97 i3 = ~i3;

always @ (posedge clk , posedge reset)
begin
	if(reset)
		sel <= 2'b00;
	else
		sel <= sel + 1;
end
endmodule

