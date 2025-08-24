# 外れ値除外 / 統計的に外れ値を除外する（3σ外の除外）（level2）
# レシート明細データの売上金額を顧客単位に合計し、合計した売上金額の外れ値を抽出せよ。
# なお、外れ値は売上金額合計を対数化したうえで平均と標準偏差を計算し、その平均から3σを超えて離れたものとする（自然対数と常用対数のどちらでも可）。
# 結果は10件表示せよ。

df_receipt |> 
  summarize(amount = sum(amount), .by = customer_id) |> 
  mutate(
    log_amount = log(amount + 1),
    z_score    = as.vector(scale(log_amount))
  ) |> 
  filter(abs(z_score) > 3) |> 
  slice_head(n = 10)
