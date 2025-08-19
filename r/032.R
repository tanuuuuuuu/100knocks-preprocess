# 統計量 / データのパーセンタイル値を求める（level2）
# レシート明細データの売上金額（amount）について、25%刻みでパーセンタイル値を求めよ。

library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |>
    summarise(
        min = quantile(amount, 0),
        q1 = quantile(amount, 0.25),
        q2 = quantile(amount, 0.5),
        q3 = quantile(amount, 0.75),
        max = quantile(amount, 1),
    )
