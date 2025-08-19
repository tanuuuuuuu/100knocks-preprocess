# 前方一致 / 正規表現の前方一致で条件指定する（level2）
# 顧客データからステータスコード（status_cd）の先頭がアルファベットのA〜Fで始まるデータを全項目抽出し、10件表示せよ。

df_customer |>
  filter(str_starts(status_cd, r"([A-F])")) |> 
  slice_head(n = 10)
