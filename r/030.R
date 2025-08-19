# 統計量 / 対象データの分散を求める（level2）
# レシート明細データに対し、店舗コード（store_cd）ごとに売上金額（amount）の母分散を計算し、降順で5件表示せよ。

df_receipt |>
  summarise(vars_amount = var(amount) * (n() - 1) / n(), .by = store_cd) |> 
  arrange(desc(vars_amount)) |> 
  slice_head(n = 5)
