# 並べ替え / データを昇順に並べる（level1）
# 顧客データを生年月日（birth_day）で高齢順にソートし、先頭から全項目を10件表示せよ。

df_customer |> 
  arrange(birth_day) |> 
  slice_head(n = 10)
