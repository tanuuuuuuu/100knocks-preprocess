# 正規化（Min-Max normalization） / 最小値0、最大値1に変換する（level2）
# レシート明細データの売上金額（amount）を顧客ID（customer_id）ごとに合計し、売上金額合計を最小値0、最大値1に正規化して顧客ID、売上金額合計とともに10件表示せよ。
# ただし、顧客IDが"Z"から始まるものは非会員を表すため、除外して計算すること

df_receipt |> 
  filter(!str_starts(customer_id, "Z")) |> 
  summarize(amount = sum(amount), .by = customer_id) |> 
  mutate(
    min_max_score = scale(
      amount,
      center = min(amount),
      scale = max(amount) - min(amount)
    )
  ) |> 
  slice_head(n = 10)
