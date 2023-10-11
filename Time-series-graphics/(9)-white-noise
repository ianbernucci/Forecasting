## WHITE NOISE

set.seed(30)
y <- tsibble(sample = 1:50, wn = rnorm(50), index = sample)
y |> autoplot(wn) + labs(title = "White noise", y = "")


y |>
  ACF(wn) |>
  autoplot() + labs(title = "White noise")


# Example: pigs slaughtered
pigs <- aus_livestock |>
  filter(State == "Victoria", Animal == "Pigs", year(Month) >= 2014)
pigs |> autoplot(Count / 1e3) + 
  labs(y = "Thousands", title = "Number of pigs slaughtered in Victoria")

pigs |>
  ACF(Count) |>
  autoplot()
