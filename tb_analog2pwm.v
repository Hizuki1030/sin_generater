`timescale 1ns / 1ps


module tb_analog2pwm;
// テストベンチ内で使用する信号の宣言
reg clk;
reg [7:0] analog0 = 8'd127;

wire out_clk0,out_clk1;

wire low_freq_clk

low_freq_counter lfc(
    .clk(clk),
    .out_clk(low_freq_clk)
)

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
    #100000;

    // シミュレーション終了
    $finish;
end

endmodule

