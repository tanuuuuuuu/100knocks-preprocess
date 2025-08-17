# 複数条件 / 複数条件に合致する行を抽出する①（level1）
# レシート明細データから売上年月日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、以下の条件を満たすデータを抽出せよ。
# 条件1: 顧客ID（customer_id）が"CS018205000001"
# 条件2: 売上金額（amount）が1000以上
library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |> 
    select(sales_ymd, customer_id, product_cd, amount) |>
    filter(customer_id == "CS018205000001", amount >= 1000)

# A tibble: 3 × 4
#   sales_ymd customer_id    product_cd amount
#       <dbl> <chr>          <chr>       <dbl>
# 1  20180911 CS018205000001 P071401012   2200
# 2  20190226 CS018205000001 P071401020   2200
# 3  20180911 CS018205000001 P071401005   1100