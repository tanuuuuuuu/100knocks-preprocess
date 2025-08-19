# 自己結合による時系列のずらし / n件前のデータを結合する（level3）
# レシート明細データの売上金額（amount）を日付（sales_ymd）ごとに集計し、前回売上があった日からの売上金額増減を計算せよ。
# そして結果を10件表示せよ。

library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |>
  summarize(amount = sum(amount), .by = sales_ymd) |> 
  arrange(sales_ymd) |> 
  mutate(
    lag_amount  = lag(amount, order_by = sales_ymd),
    diff_amount = amount - lag_amount
  ) |> 
  slice_head(n = 10)
