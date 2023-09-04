module good_counter (input clk , input reset , output reg [1:0] cnt);
wire comp;

assign comp = (cnt == 2'b10);

always @(posedge clk , posedge reset)
begin
	if(reset)
		cnt <= 2'b00;
	else if(comp)
		cnt <= 2'b00;
	else
		cnt <= cnt+1;
end



endmodule
