
module opt_check3 (input a , input b, input c , output y);
	assign y = a?(c?b:0):0;
endmodule
