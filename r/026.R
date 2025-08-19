# Max/Min / 集計結果に対する条件指定で絞り込む（level1）
# レシート明細データに対し、顧客ID（customer_id）ごとに最も新しい売上年月日（sales_ymd）と古い売上年月日を求め、両者が異なるデータを10件表示せよ。

df_receipt |>
  summarize(
    max = max(sales_ymd),
    min = min(sales_ymd),
    .by = customer_id
  ) |>
  filter(max != min) |> 
  slice_head(n = 10)
