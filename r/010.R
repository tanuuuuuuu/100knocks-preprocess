# 前方一致 / データの前方一致で条件指定する（level1）
# 店舗データから、店舗コード（store_cd）が"S14"で始まるものだけ全項目抽出し、10件表示せよ。

df_store |>
  filter(str_starts(store_cd, "S14")) |> 
  slice_head(n = 10)
