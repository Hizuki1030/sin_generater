module analog2pwm_module(
    input clk,
    input [`ANALOG_BIT_SIZE -1:0] analog,
    output reg out_clk
);

reg [`ANALOG_BIT_SIZE -1 :0] counter=0;

initial begin

    out_clk <=0;

end

always @(posedge clk) begin
    counter <= counter +1;
    if(counter > analog) begin
        out_clk <= 0;
    end else begin
    	out_clk <= 1;
    end

end
endmodule
