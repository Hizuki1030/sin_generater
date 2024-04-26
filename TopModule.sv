module TopModule(
	//////////// CLOCK //////////
	input 		          		CLK1,
	input 		          		CLK2,
	//////////// SEG7 //////////
	output		     [7:0]		HEX0,
	output		     [7:0]		HEX1,
	output		     [7:0]		HEX2,
	output		     [7:0]		HEX3,
	output		     [7:0]		HEX4,
	output		     [7:0]		HEX5,
	//////////// Push Button //////////
	input 		     [1:0]		BTN,
	//////////// LED //////////
	output		     [9:0]		LED,
	//////////// SW //////////
	input 		     [9:0]		SW

	);

	wire [`ANALOG_BIT_SIZE-1:0] analog0;
	reg reset =0;
	reg [7:0] divider_sig = 2096;	
	reg [7:0] divider_switching = 15;	
	wire low_freq_clk,switching_freq_clk;

	low_freq_counter lfc(
		 .clk(CLK1),
		 .divider(divider_sig),
		 .out_clk(low_freq_clk)
	);	
	
	low_freq_counter lfc_switching(
		 .clk(CLK1),
		 .divider(divider_switching),
		 .out_clk(switching_freq_clk)
	);

	waveform_generator wg(
		 .clk(low_freq_clk),
		 .reset(reset),
		 .sin_output(analog0)
	);

	// 分周器モジュールのインスタンス化
	analog2pwm_module uut (
		 .clk(switching_freq_clk),
		 .analog(analog0),
		 .out_clk(LED)
	);


	assign HEX0=8'hff;
	assign HEX1=8'hff;
	assign HEX2=8'hff;
	assign HEX3=8'hff;
	assign HEX4=8'hff;
	assign HEX5=8'hff;
	
endmodule
