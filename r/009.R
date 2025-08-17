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

# A tibble: 3 × 10
#   store_cd store_name prefecture_cd prefecture address                            address_kana                  tel_no longitude latitude floor_area
#   <chr>    <chr>              <dbl> <chr>      <chr>                              <chr>                         <chr>      <dbl>    <dbl>      <dbl>
# 1 S14046   北山田店              14 神奈川県   神奈川県横浜市都筑区北山田一丁目   カナガワケンヨコハマシツヅキクキタヤマタイッチョウメ…… 045-1…      140.     35.6        831
# 2 S14011   日吉本町店            14 神奈川県   神奈川県横浜市港北区日吉本町四丁目 カナガワケンヨコハマシコウホククヒヨシホンチョウヨンチョ… 045-1…      140.     35.5        890
# 3 S12013   習志野店              12 千葉県     千葉県習志野市芝園一丁目           チバケンナラシノシシバゾノイッチョウメ…… 047-1…      140.     35.7        808
