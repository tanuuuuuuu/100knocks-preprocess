# カウント / データのユニーク件数をカウントする（level1）
# レシート明細データの顧客ID（customer_id）に対し、ユニーク件数をカウントせよ。

df_receipt |>
  distinct(customer_id) |> 
  count()
