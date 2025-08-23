# 対数化 / 数値データを対数変換する（自然対数）（level2）
# レシート明細データの売上金額（amount）を顧客ID（customer_id）ごとに合計し、売上金額合計を自然対数化（底e）して顧客ID、売上金額合計とともに10件表示せよ。
# ただし、顧客IDが"Z"から始まるものは非会員を表すため、除外して計算すること。

df_receipt |> 
  filter(!str_starts(customer_id, "Z")) |> 
  summarize(amount = sum(amount), .by = customer_id) |> 
  mutate(log_amount = log(amount + 1)) |> 
  slice_head(n = 10)
