# 後方一致 / データの後方一致で条件指定する（level1）
# 顧客データから顧客ID（customer_id）の末尾が1のものだけ全項目抽出し、10件表示せよ。

library(tidyverse)

df_customer <- read_csv("./data/customer.csv")
df_customer |> 
    filter(str_ends(customer_id, "1")) |> 
    slice_head(n = 10)
