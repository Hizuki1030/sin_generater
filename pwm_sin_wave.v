`timescale 1ns / 1ps


module tb_analog2pwm;
// テストベンチ内で使用する信号の宣言
reg clk;
wire [`ANALOG_BIT_SIZE-1:0] analog0;
reg reset =0;
reg [3:0] divider = 15;
wire out_clk0,out_clk1;

wire low_freq_clk;

low_freq_counter lfc(
    .clk(clk),
    .divider(divider),
    .out_clk(low_freq_clk)
);

waveform_generator wg(
    .clk(low_freq_clk),
    .reset(reset),
    .sin_output(analog0)
);

// 分周器モジュールのインスタンス化
analog2pwm_module uut (
    .clk(clk),
    .analog(analog0),
    .out_clk(out_clk0)
);



// クロック信号の生成
initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb_analog2pwm);
    clk = 0;
    forever #5 clk = ~clk; // 100 MHz のクロック（周期は10 ns）
end

// テストシナリオ
initial begin
    #500000;

    // シミュレーション終了
    $finish;
end

endmodule

