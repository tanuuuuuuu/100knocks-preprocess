# 内部結合 / トランザクションとマスタを内部結合する（level1）
# レシート明細データと店舗データを内部結合し、レシート明細データの全項目と店舗データの店舗名（store_name）を10件表示せよ。

library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_store <- read_csv("./data/store.csv")

inner_join(
    df_receipt,
    df_store |> select(store_cd, store_name),
    by = "store_cd"
) |> 
    slice_head(n = 10)
