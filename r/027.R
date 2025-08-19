# 統計量 / 対象データの平均値を求める（level1）
# レシート明細データに対し、店舗コード（store_cd）ごとに売上金額（amount）の平均を計算し、降順で5件表示せよ。

df_receipt |>
  summarise(avg_amount = mean(amount), .by = store_cd
  ) |> 
  arrange(desc(avg_amount)) |> 
  slice_head(n = 5)
