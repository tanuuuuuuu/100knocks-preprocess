# 四則演算 / 数値を引き算する（level1）
# 商品データの単価（unit_price）と原価（unit_cost）から、各商品の利益額を算出し、結果を10件表示せよ。

df_product |> 
  mutate(profit = unit_price - unit_cost) |> 
  slice_head(n = 10)

