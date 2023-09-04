



`timescale 1ns / 1ps
module tb_incomp_case;
	//input
	reg i0,i1,i2;
	reg [1:0] sel;
	// Output
	wire y;
	//TB_SIGNALS
        reg clk,reset;	

        // Instantiate the Unit Under Test (UUT)
	incomp_case uut (
		.sel(sel),
		.i0(i0),
		.i1(i1),
		.i2(i2),
		.y(y)
	);

	initial begin
	$dumpfile("tb_incomp_case.vcd");
	$dumpvars(0,tb_incomp_case);
	// Initialize Inputs
	i0 = 1'b0;
	i1 = 1'b0;
	i2 = 1'b0;
	clk = 1'b0;
	reset = 1'b0; #1;
	reset = 1'b1; #10;
	reset = 1'b0; 

	
	#5000 $finish;
	end

always #317 i0 = ~i0;
always #600 clk = ~clk;
always #37 i1 = ~i1;
always #57 i2 = ~i2;


always @(posedge clk , posedge reset)
begin
if(reset)
	sel <= 2'b00;
else
	sel <= sel + 1;
end
endmodule


