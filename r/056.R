# カテゴリ化 / 件数の少ないカテゴリを適切なカテゴリに寄せる（level1）
# 顧客データの年齢（age）をもとに10歳刻みで年代を算出し、顧客ID（customer_id）、生年月日（birth_day）とともに10件表示せよ。
# ただし、60歳以上は全て60歳代とすること。
# 年代を表すカテゴリ名は任意とする。

df_customer |>
  mutate(age_bin = if_else(age >= 60, 60, age %/% 10 * 10)) |> 
  select(customer_id, birth_day, age_bin) |> 
  slice_head(n = 10)
