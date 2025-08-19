# 日付要素の取り出し / 日付データから特定の年だけ取り出す（level2）
# レシート明細データの売上エポック秒（sales_epoch）を日付型に変換し、「年」だけ取り出してレシート番号（receipt_no）、レシートサブ番号（receipt_sub_no）とともに10件表示せよ。

df_receipt |>  
  mutate(
    sales_datetime = as_datetime(sales_epoch),
    sales_year     = year(sales_datetime)
  ) |> 
  select(receipt_no, receipt_sub_no, sales_year) |>
  slice_head(n = 10)
