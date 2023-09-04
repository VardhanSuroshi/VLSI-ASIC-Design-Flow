`timescale 1ns / 1ps
module tb_up_dn_cntr_with_load_with_start_stop;
	// Inputs
	reg clk, reset, load_en , up_dnb , start_stop_b ;
        reg	[3:0] load_data;
	reg load_en_1 , load_en_2;
	// Outputs
	wire [3:0] cnt;

        // Instantiate the Unit Under Test (UUT)
	up_dn_cntr_with_load_with_start_stop uut (
		.clk(clk),
		.reset(reset),
		.load_en(load_en),
		.load_data(load_data),
		.up_dnb(up_dnb),
		.start_stop_b(start_stop_b),
		.cnt(cnt)
	);

	initial begin
	$dumpfile("tb_up_dn_cntr_with_load_with_start_stop.vcd");
	$dumpvars(0,tb_up_dn_cntr_with_load_with_start_stop);
	// Initialize Inputs
	clk = 0;
	reset = 1;
	up_dnb = 1;
	load_en_1 = 0;
	load_en_2 = 0;
	load_data = 4'b0000;
	start_stop_b = 1'b0;
	#7000 $finish;
	end

always #5 clk = ~clk;
always #123 reset = 0;
always #130 load_data = load_data + 1;
always #540 load_en_1 = ~load_en_1;
always #1340 up_dnb  = ~up_dnb;
always #880 start_stop_b  = ~start_stop_b;
always #1 load_en = load_en_1 ^ load_en_2;

always @ (posedge clk , posedge reset)
begin
	if(reset)
		load_en_2 = 1'b0;
	else
		load_en_2 = load_en_1;
end



endmodule
