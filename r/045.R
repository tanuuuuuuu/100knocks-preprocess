# 日付型からの変換 / 日付型データを文字列データに変換する（level1）
# 顧客データの生年月日（birth_day）は日付型でデータを保有している。
# これをYYYYMMDD形式の文字列に変換し、顧客ID（customer_id）とともに10件表示せよ。

library(tidyverse)

df_customer <- read_csv("./data/customer.csv")
df_customer |> 
    select(customer_id, birth_day) |> 
    mutate(birth_day = format(birth_day, "%Y%m%d")) |> 
    slice_head(n = 10)
