## AUTOCORRELATION


# US retail trade employment example
retail <- us_employment |>
  filter(Title == "Retail Trade", year(Month) >= 1980)
retail |> autoplot(Employed)

retail |>
  ACF(Employed, lag_max = 48) |>
  autoplot()


# Google stock price example
google_2015 <- gafa_stock |>
  filter(Symbol == "GOOG", year(Date) == 2015) |>
  select(Date, Close)
google_2015

google_2015 |> autoplot(Close)

google_2015 |>
  ACF(Close, lag_max = 100)

google_2015 |>
  ACF(Close, lag_max = 100) |>
  autoplot()
