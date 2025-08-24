# 欠損列状況確認 / 欠損値がある列を確認する
# 商品データの各項目に対し、欠損数を確認せよ。

# 方法1
df_product |> 
  summarize(across(everything(), ~ sum(is.na(.))))

# 方法2
df_product |> 
  map_dbl(~ sum(is.na(.)))
