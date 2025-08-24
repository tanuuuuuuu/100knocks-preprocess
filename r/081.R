# 数値補完（平均値） / 平均値を用いて欠損値を保管する（level1）
# 単価（unit_price）と原価（unit_cost）の欠損値について、それぞれの平均値で補完した新たな商品データを作成せよ。
# なお、平均値については1円未満を丸めること（四捨五入または偶数への丸めで良い）。
# 補完実施後、各項目について欠損が生じていないことも確認すること。

df_product |>
  mutate(
    unit_price = replace_na(unit_price, round(mean(unit_price, na.rm = TRUE))),
    unit_cost  = replace_na(unit_cost, round(mean(unit_cost, na.rm = TRUE))),
  ) |> 
  map_dbl(~ sum(is.na(.)))
