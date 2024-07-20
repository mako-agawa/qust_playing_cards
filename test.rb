# 元の配列
result_array = [["たろう", 13], ["じろう", 9], ["さぶろう", 13], ["しろう", 10]]

# 最大値を見つける
max_value = result_array.map { |sub_array| sub_array[1] }.max

# 最大値を持つサブ配列をすべて見つける
winner_array = result_array.select { |sub_array| sub_array[1] == max_value }

# 結果を表示
p winner_array
