# 並べ替え / データを降順に並べる（level1）
# 顧客データを生年月日（birth_day）で若い順にソートし、先頭から全項目を10件表示せよ。

library(tidyverse)

df_customer <- read_csv("./data/customer.csv")
df_customer |> 
  arrange(desc(birth_day)) |> 
  slice_head(n = 10)
