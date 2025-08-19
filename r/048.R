# 日付型への変換 / エポック秒（UNIX時間）を日付型データに変換する（level2）
# レシート明細データの売上エポック秒（sales_epoch）は数値型のUNIX秒でデータを保有している。
# これを日付型に変換し、レシート番号（receipt_no）、レシートサブ番号（receipt_sub_no）とともに10件表示せよ。

df_receipt |> 
  mutate(sales_date = as_date(as_datetime(sales_epoch))) |> 
  select(receipt_no, receipt_sub_no, sales_date) |> 
  slice_head(n = 10)
