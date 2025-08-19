# 日付型への変換 / 数値データを日付型データに変換する（level1）
# レシート明細データの売上日（sales_ymd）はYYYYMMDD形式の数値型でデータを保有している。
# これを日付型に変換し、レシート番号（receipt_no）、レシートサブ番号（receipt_sub_no）とともに10件表示せよ。

df_receipt |> 
  mutate(sales_ymd = ymd(sales_ymd)) |> 
  select(receipt_no, receipt_sub_no, sales_ymd) |> 
  slice_head(n = 10)
