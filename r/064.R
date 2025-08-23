# 四則演算 / 数値を割り算する（level1）
# 商品データの単価（unit_price）と原価（unit_cost）から、各商品の利益率の全体平均を算出せよ。
# ただし、単価（unit_price）と原価（unit_cost）には欠損が生じていることに注意せよ。

df_product |> 
  mutate(profit_rate = (unit_price - unit_cost) / unit_price) |> 
  summarize(total_profit_rate = mean(profit_rate, na.rm = TRUE))

