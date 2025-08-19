# 統計量 / 対象データの最頻値を求める（level3）
# レシート明細データに対し、店舗コード（store_cd）ごとに商品コード（product_cd）の最頻値を求め、10件表示せよ。

df_receipt |>
  group_by(store_cd, product_cd) |> 
  summarize(n = n()) |> 
  slice_max(order_by = n, n = 1) |> 
  slice_head(n = 10)
