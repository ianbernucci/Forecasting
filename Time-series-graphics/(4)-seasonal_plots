## SEASONAL PLOTS


# A seasonal plot is a plot where the observations are plotted against the
# season at witch they're observed. Here the season is month.
a10 |>
  gg_season(Cost, labels = "both") +
  labs(y = "$ (millions)",
       title = "Seasonal plot: Antidiabetic drug sales")


# Let's have a look at another example
beer <- aus_production |>
  select(Quarter, Beer) |> filter(year(Quarter) >= 1992)
beer |> autoplot(Beer) + 
  labs(title = "Australian beer production", y = "Megalitres")
# Plotting the points makes it easier to detect when the spike happens
beer |> autoplot(Beer) + geom_point() +
  labs(title = "Australian beer production", y = "Megalitres")
# But with the seasonal plot clearly now we can see when the spike happens 
beer |> gg_season(Beer, labels = "right")


# Multiple seasonal periods
vic_elec
vic_elec |> autoplot()
vic_elec |> gg_season(Demand)
vic_elec |> gg_season(Demand, period = "week")
vic_elec |> gg_season(Demand, period = "day")
