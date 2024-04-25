#!/bin/bash


# sin tableの生成
python3 sin_table_generator.py

# Verilog ファイルのコン
iverilog -o waveform_tb parameter.v pwm_sin_wave.v low_freq_counter_module.v analog2pwm_module.v sin_signal_module.v 

# コンパイルされたシミュレーションの実行
vvp waveform_tb

# GTKWave を使って波形を表示（必要な場合）
# gtkwave waveform.vcd
