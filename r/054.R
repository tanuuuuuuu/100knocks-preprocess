# カテゴリ化 / テキストラベルからカテゴリデータを作成する（level2）
# 顧客データの住所（address）は、埼玉県、千葉県、東京都、神奈川県のいずれかとなっている。
# 都道府県ごとにコード値を作成し、顧客ID、住所とともに10件表示せよ。
# 値は埼玉県を11、千葉県を12、東京都を13、神奈川県を14とすること。

df_customer |> 
  mutate(
    pref_cd = case_when(
      str_starts(address, "埼玉県")   ~ "11",
      str_starts(address, "千葉県")   ~ "12",
      str_starts(address, "東京都")   ~ "13",
      str_starts(address, "神奈川県") ~ "14",
    )
  ) |> 
  select(customer_id, address, pref_cd) |> 
  slice_head(n = 10)
