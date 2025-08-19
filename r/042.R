# 自己結合による時系列のずらし / 過去n件のデータを結合する（level3）
# レシート明細データの売上金額（amount）を日付（sales_ymd）ごとに集計し、各日付のデータに対し、前回、前々回、3回前に売上が合った日のデータを結合せよ。
# そして結果を10件表示せよ。

library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |>
    summarize(amount = sum(amount), .by = sales_ymd) |> 
    arrange(sales_ymd) |> 
    mutate(
        lag_1_amount = lag(amount, n = 1, order_by = sales_ymd),
        lag_2_amount = lag(amount, n = 2, order_by = sales_ymd),
        lag_3_amount = lag(amount, n = 3, order_by = sales_ymd)
    ) |> 
    slice_head(n = 10)
