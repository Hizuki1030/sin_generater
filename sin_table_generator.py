import math
import re

# Verilog パラメータファイルを読み込む
def read_parameters(file_path):
    params = {}
    with open(file_path, 'r') as file:
        for line in file:
            match = re.match(r"`define (\w+)\s+(\d+)", line)
            if match:
                params[match.group(1)] = int(match.group(2))
    return params

# パラメータファイルからパラメータを取得
parameters = read_parameters('parameter.sv')
ANALOG_BIT_SIZE = parameters['ANALOG_BIT_SIZE']
WAVE_LENGTH = parameters['WAVE_LENGTH']

# サイン波の値を生成するためのパラメータ
AMPLITUDE = (2**ANALOG_BIT_SIZE - 1) / 2  # 最大振幅
OFFSET = (2**ANALOG_BIT_SIZE) / 2         # オフセット値

# sin_tableを計算
sin_table = [int(AMPLITUDE * math.sin(2 * math.pi * i / WAVE_LENGTH) + OFFSET) for i in range(WAVE_LENGTH)]

# ファイルに16進数形式で保存
with open('sin_table.mem', 'w') as f:
    for value in sin_table:
        f.write(f"{value:02x}\n")  # 16進数形式で書き込み、適切な桁数でフォーマット

print("~~~PARAMETER~~~")
print(f"ANALOG_BIT_SIZE: {ANALOG_BIT_SIZE}")
print(f"WAVE_LENGTH: {WAVE_LENGTH}")
print("sin_table.mem has been created with hexadecimal sine wave values based on parameters.")
