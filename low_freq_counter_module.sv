module low_freq_counter(
		input wire clk,
		input wire[7:0] divider,
        output reg out_clk
	);
	
	initial begin
		out_clk <= 0;		
	end

	reg [7:0] counter =0;
	always @(posedge clk)begin
		counter <= counter +1;;
		if(counter % divider == 0)begin
			out_clk = ~ out_clk;
		end	
	end

endmodule
