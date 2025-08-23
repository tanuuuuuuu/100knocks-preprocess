# 層化 / カテゴリの割合に応じたサンプリングを行う（層化抽出）（level1）
# 顧客データから性別コード（gender_cd）の割合に基づきランダムに10％のデータを層化抽出し、性別コードごとに件数を集計せよ。

df_customer |> 
  slice_sample(prop = 0.1, by = gender_cd) |> 
  count(gender_cd)
