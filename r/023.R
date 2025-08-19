# 合計 / 対象データの合計値を算出する（level1）
# レシート明細データに対し、店舗コード（store_cd）ごとに売上金額（amount）と売上数量（quantity）を合計せよ。

library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |>
  summarize(
    amount   = sum(amount),
    quantity = sum(quantity),
    .by      = store_cd
  )
