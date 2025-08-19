# 列指定 / 特定の列を抽出する（level1）
# レシート明細データから売上年月日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、10件表示せよ。
library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |> 
  select(sales_ymd, customer_id, product_cd, amount) |> 
  slice_head(n = 10)
