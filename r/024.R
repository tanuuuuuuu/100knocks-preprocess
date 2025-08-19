# Max/Min / 対象データの最大値を求める（level1）
# レシート明細データに対し、顧客ID（customer_id）ごとに最も新しい売上年月日（sales_ymd）を求め、10件表示せよ。

library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |>
  summarize(max = max(sales_ymd), .by = customer_id) |> 
  slice_head(n = 10)
