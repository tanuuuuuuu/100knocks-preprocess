# Max/Min / 対象データの最小値を求める（level1）
# レシート明細データに対し、顧客ID（customer_id）ごとに最も古い売上年月日（sales_ymd）を求め、10件表示せよ。

library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |>
    summarize(
        min = min(sales_ymd),
        .by = customer_id
    ) |> 
    slice_head(n = 10)

