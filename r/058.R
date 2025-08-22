# ダミー変数化 / ダミー変数（0と1）に変換する（カテゴリ型→ダミー変数）（level2）
# 顧客データの性別コード（gender_cd）をダミー変数化し、顧客ID（customer_id）とともに10件表示せよ。

df_customer |> 
  fastDummies::dummy_cols("gender_cd") |> 
  select(customer_id, starts_with("gender_cd_")) |> 
  slice_head(n = 10)
