# 列名変更 / 指定列の列名を変更する（level1）
# レシート明細データから売上年月日（sales_ymd）、顧客ID（customer_id）、商品コード（product_cd）、売上金額（amount）の順に列を指定し、10件表示せよ。
# ただし、sales_ymdはsales_dateに項目名を変更しながら抽出すること。

df_receipt |> 
  select(sales_date = sales_ymd, customer_id, product_cd, amount) |> 
  slice_head(n = 10)
