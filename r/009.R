# 補集合 / ド・モルガンの法則で書き換える（level2）
# 以下の処理において、出力結果を変えずにORをANDに書き換えよ。
# df_store %>% filter(!(prefecture_cd == "13" | floor_area > 900))

library(tidyverse)

df_store <- read_csv("./data/store.csv")
df_store |> 
  filter(
    prefecture_cd != "13",
    floor_area <= 900
  )
