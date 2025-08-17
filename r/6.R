# 複数条件 / 複数条件に合致する行を抽出する②（level1）
# レシート明細データから売上年月日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上数量（quantity）、売上金額（amount）の順に列を指定し、以下の条件を満たすデータを抽出せよ。
# 条件1: 顧客ID（customer_id）が"CS018205000001"
# 条件2: 売上金額（amount）が1000以上または売上数量（quantity）が5以上
library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |> 
    select(sales_ymd, customer_id, product_cd, quantity, amount) |>
    filter(
        customer_id == "CS018205000001",
        amount >= 1000 | quantity >= 5
    )

# A tibble: 5 × 5
#   sales_ymd customer_id    product_cd quantity amount
#       <dbl> <chr>          <chr>         <dbl>  <dbl>
# 1  20180911 CS018205000001 P071401012        1   2200
# 2  20180414 CS018205000001 P060104007        6    600
# 3  20170614 CS018205000001 P050206001        5    990
# 4  20190226 CS018205000001 P071401020        1   2200
# 5  20180911 CS018205000001 P071401005        1   1100