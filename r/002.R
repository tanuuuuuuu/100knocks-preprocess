# 列指定 / 特定の列を抽出する（level1）
# レシート明細データから売上年月日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、10件表示せよ。
library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |> 
    select(sales_ymd, customer_id, product_cd, amount) |> 
    slice_head(n = 10)

# A tibble: 10 × 4
#    sales_ymd customer_id    product_cd amount
#        <dbl> <chr>          <chr>       <dbl>
#  1  20181103 CS006214000001 P070305012    158
#  2  20181118 CS008415000097 P070701017     81
#  3  20170712 CS028414000014 P060101005    170
#  4  20190205 ZZ000000000000 P050301001     25
#  5  20180821 CS025415000050 P060102007     90
#  6  20190605 CS003515000195 P050102002    138
#  7  20181205 CS024514000042 P080101005     30
#  8  20190922 CS040415000178 P070501004    128
#  9  20170504 ZZ000000000000 P071302010    770
# 10  20191010 CS027514000015 P071101003    680