# 部分一致 / 正規表現の部分一致で条件指定する（level2）
# 顧客データからステータスコード（status_cd）の先頭がアルファベットのA〜Fで始まり、末尾が数字の1〜9で始まるデータを全項目抽出し、10件表示せよ。

df_customer |>
  filter(str_detect(status_cd, r"(^[A-F].*[1-9]$)")) |> 
  slice_head(n = 10)
