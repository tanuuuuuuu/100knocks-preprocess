# 全項目指定 / 全項目を指定行数抽出する（level1）
# レシート明細データから全項目の先頭10行を表示し、どのようなデータを保有しているか目視で確認せよ。
library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |>
  slice_head(n = 10)
