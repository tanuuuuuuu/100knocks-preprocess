# 小数の扱い / 乗算結果に対して有効桁数未満を切り捨てる（level1）
# 商品データの各商品について、消費税率10％の税込み金額を求めよ。
# 1円未満の端数は切り捨てとし、結果を10件表示せよ。
# ただし、単価（unit_price）には欠損が生じていることに注意せよ。

df_product |> 
  mutate(unit_price_in_tax = trunc(unit_price * 1.1)) |> 
  slice_head(n = 10)
