# 二値化 / 文字データを二値（0と1）データに変換する（level2）
# 顧客データの郵便番号（postal_cd）に対し、東京（先頭3桁が100〜209のもの）を1、それ以外のものを0に二値化せよ。
# さらにレシート明細データと結合し、全期間において売上実績のある顧客数を、作成した二値ごとにカウントせよ。

df_customer |> 
  mutate(
    postal_prefix = as.integer(str_extract(postal_cd, r"([0-9]{3})")),
    is_tokyo      = if_else(between(postal_prefix, 100, 209), 1, 0) 
  )|> 
  inner_join(df_receipt, by = "customer_id") |> 
  summarize(n = n_distinct(customer_id), .by = is_tokyo)
