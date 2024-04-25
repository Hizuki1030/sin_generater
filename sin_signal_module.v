module waveform_generator(
        input clk,             // クロック信号
        input reset,           // リセット信号
        output reg [`ANALOG_BIT_SIZE-1:0] sin_output  // 出力されるサイン値
        );

reg [`ANALOG_BIT_SIZE-1:0] sin_table [0:`WAVE_LENGTH -1];

initial begin
    $readmemh("sin_table.mem", sin_table);
end
// 内部フェーズカウンタ（シミュレーションのための仮の実装）
// $clog2を使用してphase_counterのビット幅を計算
localparam PHASE_WIDTH = $clog2(`WAVE_LENGTH);

// フェーズカウンタの宣言（適切なビット幅で）
reg [PHASE_WIDTH-1:0] phase_counter = 0;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        sin_output <= 0;
        phase_counter <= 0;
    end else begin
        sin_output <= sin_table[phase_counter]; // フェーズカウンタに基づいてサイン値を読み出す
        phase_counter <= phase_counter + 1; // フェーズカウンタをインクリメント
    end
end

endmodule
