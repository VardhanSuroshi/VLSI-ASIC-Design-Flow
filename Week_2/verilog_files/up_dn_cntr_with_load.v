
module up_dn_cntr_with_load (input clk , input reset, input [3:0] load_data, input load_en , input up_dnb , output reg [3:0] cnt);

always @ (posedge clk , posedge reset)
begin
	if(reset)
		cnt <= 4'b0000;
	else 
	begin
		if(load_en)
			cnt <= load_data;
		else
		begin
			if(up_dnb)
				cnt <= cnt + 1;
			else
				cnt <= cnt - 1;
		end
	end
end
endmodule
