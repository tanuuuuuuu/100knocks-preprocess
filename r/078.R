# 外れ値除外 / 統計的に外れ値を除外する（IQR1.5倍の除外）（level2）
# レシート明細データの売上金額を顧客単位に合計し、合計した売上金額の外れ値を抽出せよ。
# ただし、顧客IDが"Z"から始まるものは非会員を表すため、除外して計算すること。
# なお、ここでは外れ値を第1四分位と第3四分位の差であるIQRを用いて、「第1四分位-1.5✕IQR」より下回るもの、または「第3四分位+1.5✕IQR」を超えるものとする。
# 結果は10件表示せよ。

df_receipt |> 
  filter(!str_starts(customer_id, "Z")) |> 
  summarize(amount = sum(amount), .by = customer_id) |> 
  mutate(
    q1  = quantile(amount, 0.25),
    q3  = quantile(amount, 0.75),
    IQR = q3 - q1,
    lower = q1 - 1.5 * IQR,
    upper = q3 + 1.5 * IQR,
  ) |> 
  filter(!between(amount, lower, upper)) |> 
  slice_head(n = 10)
