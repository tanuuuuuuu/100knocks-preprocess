# 集計結果の演算 / 集計結果から割合を計算する（level2）
# レシート明細データと商品データを結合し、顧客毎に全商品の売上金額合計と、カテゴリ大区分コード（category_major_cd）が"07"（瓶詰缶詰）の売上金額合計を計算の上、両者の比率を求めよ。
# 抽出対象はカテゴリ大区分コード"07"（瓶詰缶詰）の売上実績がある顧客のみとし、結果を10件表示せよ。

inner_join(df_receipt, df_product, by = "product_cd") |> 
  summarize(
    total_amount    = sum(amount),
    total_07_amount = sum(if_else(category_major_cd == "07", amount, 0)),
    .by = customer_id
  ) |> 
  filter(total_07_amount > 0) |> 
  mutate(
    rate_07_amount = total_07_amount / total_amount
  ) |> 
  slice_head(n = 10)
