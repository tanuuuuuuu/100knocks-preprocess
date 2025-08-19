# 後方一致 / 正規表現の後方一致で条件指定する（level2）
# 顧客データからステータスコード（status_cd）の末尾が数字の1〜9で始まるデータを全項目抽出し、10件表示せよ。

library(tidyverse)

df_customer <- read_csv("./data/customer.csv")
df_customer |>
  filter(str_ends(status_cd, r"([1-9])")) |> 
  slice_head(n = 10)
