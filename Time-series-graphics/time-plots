## TIME PLOTS


# Using the autoplot() function to plot the total cost of a10 drugs per month in millions of dollars
a10 |>
  autoplot(Cost) + labs(y = "$ (millions)",
                    title = "Australian antidiabetic drug sales")


# We get the same output using the geom_line() function from ggplot
a10 |>
  ggplot(aes(x=Month, y=Cost)) +
  geom_line()


# Plotting the points on top of the line might be useful
a10 |>
  autoplot(Cost) + geom_point()


# Ansett tsibble
  # [1W] Weekly data
  # 4 Variables
  # 2 Keys: Airports and Class
  # 1 Time Index
  # 1 Passengers
ansett
ansett |> autoplot(Passengers)
# The distinct() function shows you the distinct categories within each key
ansett |> distinct(Class)
ansett |> distinct(Airports)
  # 10 Airports * 3 Class = 30 unique time series

# Let's filter by class economy
ansett |>
  filter(Class == "Economy") |>
  autoplot()
           
# Let's filter some particular series
melsyd_economy <- ansett |>
  filter(Airports == "MEL-SYD") |>
  select(-Airports)
# Have a look at what we have
melsyd_economy
melsyd_economy |>
  autoplot()

# So we now have all Melbourne to Sydney travel for all three classes
# Let's filter and plot the Economy class series
melsyd_economy |>
  filter(Class == "Economy") |>
  # Bring the scale into something more workable
  mutate(Passengers = Passengers/1000)|>
  autoplot(Passengers) +
  labs(title = "Ansett airlines economy class",
       y = "Passengers ('000)")
