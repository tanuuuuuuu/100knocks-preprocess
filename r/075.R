# ランダム / ランダムサンプリングを行う（単純無作為抽出）（level1）
# 顧客データからランダムに1％のデータを抽出し、先頭から10件表示せよ。

df_customer |> 
  slice_sample(prop = 0.01) |> 
  slice_head(n = 10)
