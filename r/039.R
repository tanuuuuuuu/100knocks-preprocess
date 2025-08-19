# 完全外部結合 / 完全外部結合ですべてのレコードを残す（level2）
# レシート明細データから、売上日数の多い顧客の上位20件を抽出したデータと、売上金額合計の多い顧客の上位20件を抽出したデータをそれぞれ作成し、さらにその2つを完全外部結合せよ。
# ただし、非会員（顧客IDが"Z"から始まるもの）は除外すること。

df_receipt_common <- df_receipt |> 
	filter(!str_starts(customer_id, "Z"))

full_join(
	df_receipt_common |>
		summarize(day_count = n_distinct(sales_ymd), .by = customer_id) |>
		slice_max(day_count, n = 20),
	df_receipt_common |>
		summarize(amount = sum(amount), .by = customer_id) |>
		slice_max(amount, n = 20),
	by = "customer_id"
)
