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
