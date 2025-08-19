# 条件指定でのサブクエリ / 検索結果を条件指定に使った副問合せを行う（level2）
# レシート明細データに対し、顧客ID（customer_id）ごとに売上金額（amount）を合計して全顧客の平均を求め、平均以上に買い物をしている顧客を抽出し、10件表示せよ。
# ただし、顧客IDが"Z"から始まるものは非会員を表すため、除外して計算すること

library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |>
  filter(!str_starts(customer_id, "Z")) |>
  summarize(amount = sum(amount), .by = customer_id) |> 
  mutate(mean_amount = mean(amount)) |> 
  filter(amount >= mean_amount) |> 
  slice_head(n = 10)
