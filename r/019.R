# 順位 / 順位付けする（level2）
# レシート明細データに対し、1件あたりの売上金額（amount）が高い順にランクを付与し、先頭から10件表示せよ。
# 項目は顧客ID（customer_id）、売上金額（amount）、付与したランクを表示させること。
# なお、売上金額が等しい場合は同一順位を付与するものとする。

df_receipt |>
  select(customer_id, amount) |> 
  mutate(rank = min_rank(desc(amount))) |> 
  arrange(rank) |> 
  slice_head(n = 10)
