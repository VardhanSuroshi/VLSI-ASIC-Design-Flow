module good_shift_reg (input clk , input reset , input d , output reg dout);
reg q1;
always @ (posedge clk , posedge reset)
begin
	if(reset)
	begin
		q1 <= 1'b0;
		dout <= 1'b0;
	end
	else
	begin
		dout <= q1;
		q1 <= d;
	end
end
endmodule
