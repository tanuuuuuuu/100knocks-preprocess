# 統計量 / 統計量に対する条件指定で絞り込む（level1）
# レシート明細データに対し、店舗コード（store_cd）ごとに売上金額（amount）の平均を計算し、330以上のものを抽出せよ。

df_receipt |>
  summarise(mean_amount = mean(amount), .by = store_cd) |> 
  filter(mean_amount >= 330)
