# 検索結果からのサブクエリ / 検索結果から集計する（level1）
# レシート明細データに対し、顧客ID（customer_id）ごとに売上金額（amount）を合計して全顧客の平均を求めよ。
# ただし、顧客IDが"Z"から始まるものは非会員を表すため、除外して計算すること

df_receipt |>
  filter(!str_starts(customer_id, "Z")) |> 
  summarize(amount = sum(amount), .by = customer_id) |> 
  summarize(mean_amount = mean(amount))
