# カテゴリ化 / カテゴリ同士を組み合わせた新たなカテゴリを作成する（level2）
# KNOCK056の抽出結果と性別コード（gender_cd）により、新たに性別✕年代の組み合わせを表すカテゴリデータを作成し、10件表示せよ。
# 組み合わせを表すカテゴリの値は任意とする。

df_customer |>
  mutate(
    age_bin    = if_else(age >= 60, 60, age %/% 10 * 10),
    gender_era = str_c(gender_cd, age_bin)
  ) |> 
  select(customer_id, birth_day, gender_era) |> 
  slice_head(n = 10)
