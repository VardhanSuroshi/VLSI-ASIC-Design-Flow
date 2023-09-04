module ripple_counter (input clk , input reset , output [1:0] q);
reg [1:0]q_int;

always @ (posedge clk, posedge reset)
begin
	if(reset)
		q_int[0] <= 1'b0;
	else
		q_int[0] <= ~q_int[0];
end


always @ (posedge q_int[0], posedge reset)
begin
	
	if(reset)
		q_int[1] <= 1'b0;
	else
		q_int[1] <= ~q_int[1];

end

assign q = q_int;

endmodule
