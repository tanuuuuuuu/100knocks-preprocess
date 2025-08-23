# 経過時間の計算 / 月日からの経過日数を計算する（level3）
# レシート明細データの売上日（sales_ymd）に対し、当該週の月曜日からの経過日数を計算し、売上日、直前の月曜日付とともに10件表示せよ（sales_ymdは数値データを保持している点に注意）。

df_receipt |> 
  mutate(
    sales_ymd    = ymd(sales_ymd),
    elapsed_days = wday(sales_ymd, week_start = 1) - 1,
    prev_monday  = sales_ymd - elapsed_days,
    .keep        = "used"
  ) |> 
  slice_head(n = 10)