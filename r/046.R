# 日付型への変換 / 文字データを日付型データに変換する（level1）
# 顧客データの申し込み日（application_date）はYYYYMMDD形式の文字列型でデータを保有している。
# これを日付型に変換し、顧客ID（customer_id）とともに10件表示せよ。

df_customer |> 
  mutate(application_date = ymd(application_date)) |>
  select(customer_id, application_date) |> 
  slice_head(n = 10)
