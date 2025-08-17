# 部分一致 / データの部分一致で条件指定する（level1）
# 店舗データから、住所（address）に"横浜市"が含まれるものだけ全項目表示せよ。

library(tidyverse)

df_store <- read_csv("./data/store.csv")
df_store |> 
    filter(str_detect(address, "横浜市"))
