
module up_dn_cntr (input clk , input reset,input up_dnb , output reg [3:0] cnt);
always @ (posedge clk , posedge reset)
begin
	if(reset)
		cnt <= 4'b0000;
	else 
	begin
		if(up_dnb)
			cnt <= cnt + 1;
		else
			cnt <= cnt - 1;
	end
end
endmodule
