# フォーマット一致 / 特定のデータ書式で条件指定する（level2）
# 店舗データから、電話番号（tel_no）が3桁-3桁-4桁のデータを全項目表示せよ。

library(tidyverse)

df_store <- read_csv("./data/store.csv")
df_store |> 
    filter(str_detect(tel_no, r"(^[0-9]{3}-[0-9]{3}-[0-9]{4}$)"))
