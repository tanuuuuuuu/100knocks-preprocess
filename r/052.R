# 二値化 / 数値データを二値（0と1）データに変換する（level1）
# レシート明細データの売上金額（amount）を顧客ID（customer_id）ごとに合計の上、売上金額合計に対して2000円以下を0、2000円より大きい金額を1に二値化し、顧客ID、売上金額合計とともに10件表示せよ。
# ただし、顧客IDが"Z"から始まるものは非会員を表すため、除外して計算すること。

df_receipt |> 
  filter(!str_starts(customer_id, "Z")) |> 
  summarize(
    amount             = sum(amount),
    is_above_over_2000 = if_else(amount > 2000, 1, 0),
    .by = customer_id
  ) |> 
  slice_head(n = 10)
