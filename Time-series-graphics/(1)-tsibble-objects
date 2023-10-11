## TSIBBLE OBJETCS


# fpp3, a forecasting lib
install.packages("fpp3")
library (fpp3)
install.packages("readr")
library(readr)


# Some examples of tsibble objects
tourism
global_economy
olympic_running


# Creating a very simple tsibble
y <- tsibble(
  Year = 2015:2019,
  Observation = c(123, 39, 78, 52, 110),
  index = Year
)
y

# Working with tsibble objects
PBS |>
  # We can use the filter() function to select rows
  filter(ATC2 == "A10") |>
  # We can use the select() function to select columns
  select(Month, Concession, Type, Cost) |>
  # We can use the summarise() function to summarise over keys 
  summarise(TotalC = sum(Cost)) |>
  # We can use the mutate() fuction to create new variables
  mutate(Cost = TotalC / 1e6) -> a10
a10


# Read a csv file and convert to a tsibble
prison <- readr::read_csv("https://OTexts.com/fpp3/extrafiles/prison_population.csv")
prison <- prison |>
  mutate(Quarter = yearquarter(Date)) |>
  select(-Date) |>
  as_tsibble(key = c(State, Gender, Legal, Indigenous),
             index = Quarter)
prison
