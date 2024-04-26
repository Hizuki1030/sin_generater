// waveform_generator_tb.v
`timescale 1ns / 1ps

module waveform_generator_tb;

reg clk;
reg reset;
wire [7:0] sin_output;

// テストするモジュールのインスタンス化
waveform_generator uut (
    .clk(clk),
    .reset(reset),
    .sin_output(sin_output)
);

// クロック生成
always #10 clk = ~clk;  // 100MHzのクロック

initial begin
    // VCDファイルの設定
    $dumpfile("waveform.vcd");
    $dumpvars(0, waveform_generator_tb);

    // 初期化
    clk = 0;
    reset = 0;

    // シミュレーション時間
    #10000 $finish;
end

endmodule
