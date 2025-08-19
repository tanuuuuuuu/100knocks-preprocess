# 内部結合 / マスタ同士を内部結合する（level1）
# 商品データとカテゴリデータを内部結合し、商品データの全項目とカテゴリデータのカテゴリ小区分名（category_small_name）を10件表示せよ

library(tidyverse)

df_product <- read_csv("./data/product.csv")
df_category <- read_csv("./data/category.csv")

inner_join(
    df_product,
    df_category |> select(category_small_cd, category_small_name),
    by = "category_small_cd"
) |> 
    slice_head(n = 10)
