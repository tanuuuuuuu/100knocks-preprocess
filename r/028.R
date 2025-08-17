# 統計量 / 対象データの中央値を求める（level1）
# レシート明細データに対し、店舗コード（store_cd）ごとに売上金額（amount）の中央値を計算し、降順で5件表示せよ。

library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |>
    summarise(avg_amount = median(amount), .by = store_cd) |> 
    arrange(desc(avg_amount)) |> 
    slice_head(n = 5)
