# 左外部結合 / 左外部結合でデータを残す（level2）
# 顧客データとレシート明細データから、顧客ごとの売上金額合計を求め、10件表示せよ。
# ただし、売上実績がない顧客については売上金額を0として表示させること。
# また、顧客は性別コード（gender_cd）が女性（1）であるものを対象とし、非会員（顧客IDが"Z"から始まるもの）は除外すること。

library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_customer <- read_csv("./data/customer.csv")

left_join(
  df_customer,
  df_receipt |> summarize(amount = sum(amount), .by = "customer_id"),
  by = "customer_id"
) |> 
  filter(
    gender_cd == 1,
    !str_starts(customer_id, "Z")
  ) |>
  mutate(amount = coalesce(amount, 0)) |> 
  select(customer_id, amount) |> 
  slice_head(n = 10)
