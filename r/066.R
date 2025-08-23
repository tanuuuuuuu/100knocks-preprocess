# 小数の扱い / 除算結果に対して有効桁数未満を四捨五入する（level1）
# 商品データの各商品について、利益率が30％となる新たな単価を求めよ。
# ただし、1円未満を丸めること（四捨五入または偶数への丸めで良い）。
# そして結果を10件表示させ、利益率がおよそ30％付近であることを確認せよ。
# ただし、単価（unit_price）と原価（unit_cost）には欠損が生じていることに注意せよ。

df_product |> 
  mutate(
    new_unit_price  = round(unit_cost / 0.7),
    new_profit_rate = (new_unit_price - unit_cost) / new_unit_price 
  ) |> 
  slice_head(n = 10)
