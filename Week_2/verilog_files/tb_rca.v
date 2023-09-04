`timescale 1ns / 1ps
module tb_rca;
	// TB_SIGNALS
	reg clk, reset   ;
	reg [7:0] num1 ;
	reg [7:0] num2;
	wire [8:0] sum_out;
	// Instantiate the Unit Under Test (UUT)
	rca uut (
		.num1(num1),
		.num2(num2),
		.sum(sum_out)
	);

	initial begin
	$dumpfile("tb_rca.vcd");
	$dumpvars(0,tb_rca);
	// Initialize Inputs
	clk = 0;
	reset = 0;
	reset = 1; #1;
	reset = 0; #10;
	#30000 $finish;
	end

always #10 clk = ~clk;


always @ (clk,reset)
begin
	if(reset)
	begin
		num1 <= 8'b0;
		num2 <= 8'b0;
	end
	else
	begin
		num1 = num1 + 1;
		if(num1[3:0] == 4'b1111)
			num2 = num2+1;	
	end

end


endmodule


