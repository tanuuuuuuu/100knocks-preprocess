# 順位 / 順位付けする（level2）
# レシート明細データに対し、1件あたりの売上金額（amount）が高い順にランクを付与し、先頭から10件表示せよ。
# 項目は顧客ID（customer_id）、売上金額（amount）、付与したランクを表示させること。
# なお、売上金額が等しい場合は同一順位を付与するものとする。

library(tidyverse)

df_receipt <- read_csv("./data/receipt.csv")
df_receipt |>
    select(customer_id, amount) |> 
    mutate(rank = min_rank(desc(amount))) |> 
    arrange(rank) |> 
    slice_head(n = 10)

# A tibble: 10 × 3
#    customer_id    amount  rank
#    <chr>           <dbl> <int>
#  1 CS011415000006  10925     1
#  2 ZZ000000000000   6800     2
#  3 CS028605000002   5780     3
#  4 CS015515000034   5480     4
#  5 ZZ000000000000   5480     4
#  6 ZZ000000000000   5480     4
#  7 ZZ000000000000   5440     7
#  8 CS021515000089   5440     7
#  9 CS015515000083   5280     9
# 10 CS017414000114   5280     9