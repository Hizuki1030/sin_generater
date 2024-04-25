import math

# サイン波の値を生成するためのパラメータ
SAMPLES = 256
AMPLITUDE = 127.5  # 255の半分
OFFSET = 128       # 8ビットデータの中央値

# sin_tableを計算
sin_table = [int(AMPLITUDE * math.sin(2 * math.pi * i / SAMPLES) + OFFSET) for i in range(SAMPLES)]

# ファイルに16進数形式で保存
with open('sin_table.mem', 'w') as f:
    for value in sin_table:
        f.write(f"{value:02x}\n")  # 16進数形式で書き込み、2桁でフォーマット

print("sin_table.mem has been created with hexadecimal sine wave values.")
