# 不一致 / 特定条件に合致しない行を抽出する（!=）（level1）
# レシート明細データから売上年月日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、以下の条件を満たすデータを抽出せよ。
# 条件1: 顧客ID（customer_id）が"CS018205000001"
# 条件2: 商品コード（product_cd）が"P071401019"以外
library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |> 
    select(sales_ymd, customer_id, product_cd, amount) |>
    filter(
        customer_id == "CS018205000001",
        product_cd != "P071401019"
    )
