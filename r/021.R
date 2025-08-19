# カウント / データの件数をカウントする（level1）
# レシート明細データに対し、件数をカウントせよ。

library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |>
  count()
