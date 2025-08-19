# 縦から横への変換 / 縦持ちデータを横持ちデータに変換する（level2）
# レシート明細データ（receipt）と顧客データ（customer）を結合し、性別コード（gender）と年代（ageから計算）ごとに売上金額（amount）を合計した売上サマリデータを作成せよ。
# 性別コードは0が男性、1が女性、9が不明を表すものとする。
# ただし、項目構成は年代、女性の金額金額、男性の売上金額、性別不明の振り上げ金額の4項目とすること（縦に年代、横に性別のクロス集計）。
# また、年代は10歳ごとの階級とすること。

library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_customer <- read_csv("./data/customer.csv")

df_43 <- inner_join(df_customer, df_receipt, by = "customer_id") |> 
    mutate(
        age_bin = age %/% 10 * 10,
    ) |> 
    summarize(amount = sum(amount), .by = c(age_bin, gender_cd)) |>
    pivot_wider(names_from = gender_cd, values_from = amount) |>
    select(
        age_bin,
        male = `0`,
        female = `1`,
        unknown = `9`,
    ) |> 
    arrange(age_bin)
