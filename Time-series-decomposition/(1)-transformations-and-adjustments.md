The purpose of these adjustments and transformations is to simplify the patterns in the historical data by removing known sources of variation, 
or by making the pattern more consistent across the whole data set. Simpler patterns are usually easier to model and lead to more accurate forecasts.
<br><br>

**Calendar adjustments**

Some of the variation seen in seasonal data may be due to simple calendar effects. In such cases, it is usually much easier to remove the variation before doing any further analysis.

For example, if you are studying the total monthly sales in a retail store, there will be variation between the months simply because of the different 
numbers of trading days in each month, in addition to the seasonal variation across the year. It is easy to remove this variation by computing average 
sales per trading day in each month, rather than total sales in the month. Then we effectively remove the calendar variation.
<br><br>

**Population adjustments**

Any data that are affected by population changes can be adjusted to give per-capita data. That is, consider the data per person 
(or per thousand people, or per million people) rather than the total. For example, if you are studying the number of hospital beds in a particular region over time, 
the results are much easier to interpret if you remove the effects of population changes by considering the number of beds per thousand people. 
Then you can see whether there have been real increases in the number of beds, or whether the increases are due entirely to population increases. 
It is possible for the total number of beds to increase, but the number of beds per thousand people to decrease. This occurs when the population is increasing faster than the number of hospital beds. 
For most data that are affected by population changes, it is best to use per-capita data rather than the totals.

This can be seen in the _global_economy_ dataset, where a common transformation of GDP is GDP per-capita.

```r
global_economy |>
  filter(Country == "Australia") |>
  autoplot(GDP/Population) +
  labs(title= "GDP per capita", y = "$US")
```
![gdp_per_capta](https://github.com/ianbernucci/Forecasting-Principles-and-Practice/blob/main/images/gdp-per-capita.png?raw=true)
<br><br>

**Inflation adjustments**

Data which are affected by the value of money are best adjusted before modelling. For example, the average cost of a new house will have 
increased over the last few decades due to inflation. A $200,000 house this year is not the same as a $200,000 house twenty years ago. 
For this reason, financial time series are usually adjusted so that all values are stated in dollar values from a particular year. 
For example, the house price data may be stated in year 2000 dollars.

To make these adjustments, a price index is used. If **z<sub>t</sub>** denotes the price index and **y<sub>t</sub>** denotes the original house price in year **t**, 
then **x<sub>t</sub> = y<sub>t</sub> / z<sub>t</sub> * z<sub>2000</sub>** gives the adjusted house price at year 2000 dollar values. 
Price indexes are often constructed by government agencies. For consumer goods, a common price index is the Consumer Price Index (or CPI).

This allows us to compare the growth or decline of industries relative to a common price value. For example, looking at aggregate annual 
“newspaper and book” retail turnover from aus_retail, and adjusting the data for inflation using CPI from global_economy allows us to understand the changes over time.

```r
print_retail <- aus_retail |>
  filter(Industry == "Newspaper and book retailing") |>
  group_by(Industry) |>
  index_by(Year = year(Month)) |>
  summarise(Turnover = sum(Turnover))
aus_economy <- global_economy |>
  filter(Code == "AUS")
print_retail |>
  left_join(aus_economy, by = "Year") |>
  mutate(Adjusted_turnover = Turnover / CPI * 100) |>
  pivot_longer(c(Turnover, Adjusted_turnover),
               values_to = "Turnover") |>
  mutate(name = factor(name,
         levels=c("Turnover","Adjusted_turnover"))) |>
  ggplot(aes(x = Year, y = Turnover)) +
  geom_line() +
  facet_grid(name ~ ., scales = "free_y") +
  labs(title = "Turnover: Australian print media industry",
       y = "$AU")
```
![turnover](https://github.com/ianbernucci/Forecasting-Principles-and-Practice/blob/main/images/turnover.png?raw=true)
By adjusting for inflation using the CPI, we can see that Australia’s newspaper and book retailing industry has been in decline 
much longer than the original data suggests. The adjusted turnover is in 2010 Australian dollars, as CPI is 100 in 2010 in this data set.
<br><br>

**Mathematical transformations**

If the data shows variation that increases or decreases with the level of the series, then a transformation can be useful. For example, 
a logarithmic transformation is often useful. If we denote the original observations as **y<sub>1</sub>, ..., y<sub>T</sub>** and the
observations as **w<sub>1</sub>, ..., w<sub>T</sub>**, then **w<sub>t</sub> = log(y<sub>t</sub>)**. Logarithms are useful because they are 
interpretable: changes in a log value are relative (or percentage) changes on the original scale. So if log base 10 is used, then an 
increase of 1 on the log scale corresponds to a multiplication of 10 on the original scale. If any value of the original series is zero or negative, then logarithms are not possible.

Sometimes other transformations are also used (although they are not so interpretable). For example, square roots and cube roots can be used. 
These are called **power transformations** because they can be written in the form **w<sub>t</sub> = y<sup>p</sup><sub>t</sub>**

A useful family of transformations, that includes both logarithms and power transformations, is the family of **Box-Cox transformations**, 
which depend on the parameter λ and are defined as follows:
![box_cox](https://github.com/ianbernucci/Forecasting-Principles-and-Practice/blob/main/images/box_cox_transformations.png?raw=true)

This is actually a modified Box-Cox transformation, discussed in Bickel & Doksum (1981), which allows for negative values of
**y<sub>t</sub>** provided λ > 0.

The logarithm in a Box-Cox transformation is always a natural logarithm (i.e., to base e). So if λ = 0, natural logarithms are used, 
but if λ ≠ 0, a power transformation is used, followed by some simple scaling.

If λ = 1, then dasjdasda, so the transformed data is shifted downwards but there is no change in the shape of the time series. 
For all other values of λ, the time series will change shape.

A good value of λ is one which makes the size of the seasonal variation about the same across the whole series, as that makes the forecasting model simpler.

The _guerrero_ feature can be used to choose a value of lambda for you. In this case it chooses λ = 0.11:
```r
lambda <- aus_production |>
  features(Gas, features = guerrero) |>
  pull(lambda_guerrero)
aus_production |>
  autoplot(box_cox(Gas, lambda)) +
  labs(y = "",
       title = latex2exp::TeX(paste0(
         "Transformed gas production with $\\lambda$ = ",
         round(lambda,2))))
```
![transformed_gas_prod](https://github.com/ianbernucci/Forecasting-Principles-and-Practice/blob/main/images/transformed_gas_prod.png?raw=true)











