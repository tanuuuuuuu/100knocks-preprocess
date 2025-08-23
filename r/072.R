# 経過日数の計算 / 2つの日付から経過年数を計算する（level2）
# レシート明細データの売上日（sales_ymd）に対し、顧客データの会員申込日（application_date）からの経過年数を計算し、顧客ID（customer_id）、売上日、会員申込日とともに10件表示せよ（sales_ymdは数値、application_dateは文字列でデータを保持している点に注意）。
# 1年未満は切り捨てること

inner_join(df_receipt, df_customer, by = "customer_id") |> 
  select(customer_id, sales_ymd, application_date) |> 
  mutate(elapsed_years = trunc(time_length(ymd(sales_ymd) - ymd(application_date), "year"))) |> 
  distinct() |> 
  slice_head(n =10)
