# 日付要素の取り出し / 日付データから特定の月だけ取り出す（level2）
# レシート明細データの売上エポック秒（sales_epoch）を日付型に変換し、「月」だけ取り出してレシート番号（receipt_no）、レシートサブ番号（receipt_sub_no）とともに10件表示せよ。
# なお、「月」は0埋め2桁で取り出すこと。

df_receipt |>  
  mutate(
    sales_datetime = as_datetime(sales_epoch),
    sales_month    = str_pad(month(sales_datetime), 2, pad = "0")
  ) |> 
  select(receipt_no, receipt_sub_no, sales_month) |>
  slice_head(n = 10)
