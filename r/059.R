# 正規化（z-score） / 平均0、分散1に変換する（level2）
# レシート明細データの売上金額（amount）を顧客ID（customer_id）ごとに合計し、売上金額合計を平均0、標準偏差1に標準化して顧客ID、売上金額合計とともに10件表示せよ。
# 標準化に使用する標準偏差は、分散の平方根、もしくは不偏分散の平方根のどちらでも良いものとする。
# ただし、顧客IDが"Z"から始まるものは非会員を表すため、除外して計算すること

df_receipt |> 
  filter(!str_starts(customer_id, "Z")) |> 
  summarize(amount = sum(amount), .by = customer_id) |> 
  mutate(z_score = scale(amount)) |> 
  slice_head(n = 10)
