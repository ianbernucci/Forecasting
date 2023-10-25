## TIME SERIES COMPONENTS

''' 
If we assume an additive decomposition, then we can write Yt = St + Tt + Rt
wehre Yt is the data, St is the seasonal component, Tt is the trend-cycle, and
Rt is teh remainder component, all at period t.
Alternatively, a multiplicative decomposition would be written as 
Yt = St x Tt x Rt.
An alternative to using a multiplicative decomposition is to first transform 
the data until the variation in the series appears to be stable over time, 
then use an additive decomposition.
Yt = St x Tt x Rt is equivalent to log(Yt) = log(St) + log(Tt) + log(Rt).'''


#Example: Employment in the US retail sector

us_retail_employment <- us_employment |>
  filter(year(Month) >= 1990, Title == "Retail Trade") |>
  select(-Series_ID)

autoplot(us_retail_employment, Employed) +
  labs(y = "Persons (thousands)",
       title = "Total employment in US retail")

dcmp <- us_retail_employment |>
  model(stl = STL(Employed))
components(dcmp)

components(dcmp) |> autoplot()


# Seasonally adjusted data 

components(dcmp) |>
  as_tsibble() |>
  autoplot(Employed, colour = "gray") +
  geom_line(aes(y=season_adjust), colour = "#0072B2") +
  labs(y = "Persons (thousands)",
       title = "Total employment in US retail")

components(dcmp) |> gg_subseries(season_year)
