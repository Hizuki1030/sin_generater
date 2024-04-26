#!/bin/bash


# sin tableの生成
python3 sin_table_generator.py

# Verilog ファイルのコン
iverilog -o waveform_tb parameter.sv pwm_sin_wave.sv low_freq_counter_module.sv analog2pwm_module.sv sin_signal_module.sv 

# コンパイルされたシミュレーションの実行
vvp waveform_tb

# GTKWave を使って波形を表示（必要な場合）
# gtkwave waveform.vcd
