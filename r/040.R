# クロス結合 / クロス結合ですべてのレコードの組み合わせを作成する（level1）
# 全ての店舗と全ての商品を組み合わせたデータを作成したい。
# 店舗データと商品データを直積し、件数を計算せよ。

library(tidyverse)

df_store <- read_csv("./data/store.csv")
df_product <- read_csv("./data/product.csv")

cross_join(df_store, df_product) |> 
    count()
