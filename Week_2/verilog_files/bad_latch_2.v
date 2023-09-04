module bad_latch (input clk , input reset , input d , output reg q);
always @ (clk,reset)
begin
	if(reset)
		q <= 1'b0;
	else 
		q <= d;
end
endmodule
