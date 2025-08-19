# 統計量 / 対象データの標準偏差を求める（level2）
# レシート明細データに対し、店舗コード（store_cd）ごとに売上金額（amount）の母標準偏差を計算し、降順で5件表示せよ。

df_receipt |>
  summarise(stds_amount = sd(amount) * (n() - 1) / n(), .by = store_cd) |> 
  arrange(desc(stds_amount)) |> 
  slice_head(n = 5)
