## SEASONAL SUBSERIES PLOTS

a10 |>
  gg_subseries(Cost) +
  labs(
    y = "$ (millions)",
    title = "Australian antidiabetic drug sales")

beer |> gg_subseries(Beer)


# Australian holidays 
holidays <- tourism |>
  filter(Purpose == "Holiday") |>
  group_by(State) |>
  summarise(Trips = sum(Trips))
holidays

autoplot(holidays, Trips) +
  labs(y = "Overnight trips ('000)",
       title = "Australian domestic holidays")

holidays |> gg_season(Trips) +
  facet_wrap(vars(State), nrow = 2, scales = "free_y")+
  labs(y = "thousands of trips", title = "Australian domestic holiday nights")

holidays |>
  gg_subseries(Trips) +
  labs(y = "Overnight trips ('000)",
       title = "Australian domestic holidays")
