# カテゴリ化 / 数値からカテゴリデータを作成する（level2）
# レシート明細データの売上金額（amount）を顧客ID（customer_id）ごとに合計し、その合計金額の四分位点を求めよ。
# その上で、顧客ごとの売上金額合計に対して以下の基準でカテゴリ値を作成し、顧客ID、売上金額合計とともに10件表示せよ。
# カテゴリ値は順に1〜4とする。

df_receipt |>
  summarize(amount = sum(amount), .by = customer_id) |>
  mutate(pct_group = factor(ntile(amount, 4))) |>
  slice_head(n = 10)
