The first step in a classical decomposition is to use a moving average method to estimate the trend-cycle

A moving average of order m can be written as 

![ma](https://github.com/ianbernucci/Forecasting/blob/main/images/ma.png?raw=true)

where m = 2k + 1. That is, the estimate of the trend-cycle at time t is obtained by averaging values of the time series within k periods of t.

```R
global_economy |>
  filter(Country == "Australia") |>
  autoplot(Exports) +
  labs(y = "% of GDP", title = "Total Australian exports")
```

Annual Australian exports of goods and services: 1960–2017.

![australian_exports](https://github.com/ianbernucci/Forecasting/blob/main/images/australian_exports.png?raw=true)

```R
aus_exports <- global_economy |>
  filter(Country == "Australia") |>
  mutate(
    `5-MA` = slider::slide_dbl(Exports, mean,
                .before = 2, .after = 2, .complete = TRUE))
```

```R
aus_exports |>
  autoplot(Exports) +
  geom_line(aes(y = `5-MA`), colour = "#D55E00") +
  labs(y = "% of GDP",
       title = "Total Australian exports") +
  guides(colour = guide_legend(title = "series"))
```

![diff_ma](https://github.com/ianbernucci/Forecasting/blob/main/images/different_ma.png?raw=true)

<br>

**Moving averages of moving averages** 
It is possible to apply a moving average to a moving average. 
One reason for doing this is to make an even-order moving average symmetric.

For example, we might take a moving average of order 4, and then apply another moving average of order 2 to the results. 
In the following table, this has been done for the first few years of the Australian quarterly beer production data.

```R
beer <- aus_production |>
  filter(year(Quarter) >= 1992) |>
  select(Quarter, Beer)
beer_ma <- beer |>
  mutate(
    `4-MA` = slider::slide_dbl(Beer, mean,
                .before = 1, .after = 2, .complete = TRUE),
    `2x4-MA` = slider::slide_dbl(`4-MA`, mean,
                .before = 1, .after = 0, .complete = TRUE))
```

<br>

**Example: Employment in the US retail sector**
```R
us_retail_employment_ma <- us_retail_employment |>
  mutate(
    `12-MA` = slider::slide_dbl(Employed, mean,
                .before = 5, .after = 6, .complete = TRUE),
    `2x12-MA` = slider::slide_dbl(`12-MA`, mean,
                .before = 1, .after = 0, .complete = TRUE)
  )
us_retail_employment_ma |>
  autoplot(Employed, colour = "gray") +
  geom_line(aes(y = `2x12-MA`), colour = "#D55E00") +
  labs(y = "Persons (thousands)",
       title = "Total employment in US retail")
```

![ma_total_emp](https://github.com/ianbernucci/Forecasting/blob/main/images/ma_total_emp.png?raw=true)
