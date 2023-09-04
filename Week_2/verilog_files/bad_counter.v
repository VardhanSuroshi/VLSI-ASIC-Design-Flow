module bad_counter (input clk , input reset , output reg [1:0] cnt);
wire res_int;

assign res_int = (cnt == 2'b11) | reset;

always @(posedge clk , posedge res_int)
begin
	if(res_int)
		cnt <= 2'b00;
	else
		cnt <= cnt+1;
end



endmodule

