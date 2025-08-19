# 横から縦への変換 / 横持ちデータを縦持ちデータに変換する（level2）
# KNOCK043で作成した売上サマリーデータは性別の売上を横持ちさせたものであった。
# このデータから性別を縦持ちさせ、年代、性別コード、売上金額の3項目に変換せよ。
# ただし、性別コードは男性を"00"、女性を"01"、不明を"99"とする。

df_43 |>
    pivot_longer(cols = c(male, female, unknown), names_to = "gender_cd", values_to = "amount") |> 
    mutate(
        gender_cd = case_when(
            gender_cd == "male" ~ "00",
            gender_cd == "female" ~ "01",
            gender_cd == "unknown" ~ "99",
        )
    )
