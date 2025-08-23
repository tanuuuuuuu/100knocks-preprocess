# 経過時間の計算 / 2つの日付から経過時間をエポック秒で計算する（level2）
# レシート明細データの売上日（sales_ymd）に対し、顧客データの会員申込日（application_date）からのエポック秒による経過時間を計算し、顧客ID（customer_id）、売上日、会員申込日とともに10件表示せよ（なお、sales_ymdは数値、application_dateは文字列でデータを保持している点に注意）。
# なお、時間情報は保有していないため各日付は0時0分0秒を表すものとする。

inner_join(df_receipt, df_customer, by = "customer_id") |> 
  select(customer_id, sales_ymd, application_date) |> 
  mutate(elapsed_seconds = trunc(time_length(ymd(sales_ymd) - ymd(application_date), "second"))) |> 
  distinct() |>
  slice_head(n =10)
