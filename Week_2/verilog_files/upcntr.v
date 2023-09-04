module upcntr (input clk , input reset, output reg [3:0] cnt);
always @ (posedge clk , posedge reset)
begin
	if(reset)
		cnt <= 4'b0000;
	else
		cnt <= cnt + 1;
end
endmodule
