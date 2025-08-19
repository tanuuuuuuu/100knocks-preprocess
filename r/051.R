# 日付要素の取り出し / 日付データから特定の日だけ取り出す（level2）
# レシート明細データの売上エポック秒（sales_epoch）を日付型に変換し、「日」だけ取り出してレシート番号（receipt_no）、レシートサブ番号（receipt_sub_no）とともに10件表示せよ。
# なお、「日」は0埋め2桁で取り出すこと。

df_receipt |>  
  mutate(
    sales_datetime = as_datetime(sales_epoch),
    sales_day      = str_pad(day(sales_datetime), 2, pad = "0")
  ) |> 
  select(receipt_no, receipt_sub_no, sales_day) |>
  slice_head(n = 10)
