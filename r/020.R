# 順位 / 順位付けする（同一順位なし）（level2）
# レシート明細データに対し、1件あたりの売上金額（amount）が高い順にランクを付与し、先頭から10件表示せよ。
# 項目は顧客ID（customer_id）、売上金額（amount）、付与したランクを表示させること。
# なお、売上金額が等しい場合でも別順位を付与すること。

library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |>
  select(customer_id, amount) |> 
  mutate(rank = row_number(desc(amount))) |> 
  arrange(rank) |> 
  slice_head(n = 10)
