module pattern_detect_fsm (input clk , input reset,  input din , output reg pattern_detect);
reg [1:0] present_state , next_state;
always @ (posedge clk,  posedge reset)
begin
	if(reset)
	begin
		preset_state <= 2'b00;
	else
		present_state <= next_state;
end


always & (*)
begin
	next_state = present_state;
	pattern_detect = 1'b0;
	case(present_state):

		2'b00 : begin
				if(din)
					next_state = 2'b01;
			end

		2'b01 : begin
				if(!din)
					next_state = 2'b10;
			end

		2'b10 : begin
				if(din)
					next_state = 2'b11;
				else	
					next_state = 2'b00;
			end 

		2'b11 : begin
				next_state = 2'b00;
				pattern_detect = 1'b1;

			end

		default : begin
				next_state = present_state;
				pattern_detect = 1'b0;
			  end
	endcase

				
end


endmodule
