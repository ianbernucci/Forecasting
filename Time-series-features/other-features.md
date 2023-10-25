The **feat_stl()** function returns several more features.
  - **seasonal_peak_year**: indicates the timing of the peaks — which month or quarter contains the largest seasonal component. This tells us something
    about the nature of the seasonality. In the Australian tourism data, if Quarter 3 is the peak seasonal period, then people are travelling to the region in winter,
    whereas a peak in Quarter 1 suggests that the region is more popular in summer.
  - **seasonal_trough_year**: indicates the timing of the troughs — which month or quarter contains the smallest seasonal component.
  - **spikiness**: measures the prevalence of spikes in the remainder component Rt of the STL decomposition. It is the variance of the leave-one-out variances of Rt.
  - **linearity**: measures the linearity of the trend component of the STL decomposition. It is based on the coefficient of a linear regression applied to the trend component.
  - **curvature**: measures the curvature of the trend component of the STL decomposition. It is based on the coefficient from an orthogonal quadratic regression applied to the trend component.
  - **stl_e_acf1** is the first autocorrelation coefficient of the remainder series.
  - **stl_e_acf10** is the sum of squares of the first ten autocorrelation coefficients of the remainder series.

<br><br>

The remaining features in the feasts package are listed here.
  - **coef_hurst** will calculate the Hurst coefficient of a time series which is a measure of “long memory”. A series with long memory will have significant autocorrelations for many lags.
  - **feat_spectral** will compute the (Shannon) spectral entropy of a time series, which is a measure of how easy the series is to forecast. A series which has strong trend and seasonality
    (and so is easy to forecast) will have entropy close to 0. A series that is very noisy (and so is difficult to forecast) will have entropy close to 1.
  - **box_pierce** gives the Box-Pierce statistic for testing if a time series is white noise, and the corresponding p-value.
  - **ljung_box** gives the Ljung-Box statistic for testing if a time series is white noise, and the corresponding p-value.
  - The kth partial autocorrelation measures the relationship between observations k periods apart after removing the effects of observations between them. So the first partial autocorrelation
    (k = 1) is identical to the first autocorrelation, because there is nothing between consecutive observations to remove. The **feat_pacf** function contains several features involving partial
    autocorrelations including the sum of squares of the first five partial autocorrelations for the original series, the first-differenced series and the second-differenced series. For seasonal data,
    it also includes the partial autocorrelation at the first seasonal lag.
  - **unitroot_kpss** gives the Kwiatkowski-Phillips-Schmidt-Shin (KPSS) statistic for testing if a series is stationary, and the corresponding p-value.
  - **unitroot_pp** gives the Phillips-Perron statistic for testing if a series is non-stationary, and the corresponding p-value.
  - **unitroot_ndiffs** gives the number of differences required to lead to a stationary series based on the KPSS test.
  - **unitroot_nsdiffs** gives the number of seasonal differences required to make a series stationary.
  - **var_tiled_mean** gives the variances of the “tiled means” (i.e., the means of consecutive non-overlapping blocks of observations). The default tile length is either 10 (for non-seasonal data) or the
    length of the seasonal period. This is sometimes called the “stability” feature.
  - **var_tiled_var** gives the variances of the “tiled variances” (i.e., the variances of consecutive non-overlapping blocks of observations). This is sometimes called the “lumpiness” feature.
  - **shift_level_max** finds the largest mean shift between two consecutive sliding windows of the time series. This is useful for finding sudden jumps or drops in a time series.
  - **shift_level_index** gives the index at which the largest mean shift occurs.
  - **shift_var_max** finds the largest variance shift between two consecutive sliding windows of the time series. This is useful for finding sudden changes in the volatility of a time series.
  - **shift_var_index** gives the index at which the largest variance shift occurs.
  - **shift_kl_max** finds the largest distributional shift (based on the Kulback-Leibler divergence) between two consecutive sliding windows of the time series.
    This is useful for finding sudden changes in the distribution of a time series.
  - **shift_kl_index** gives the index at which the largest KL shift occurs.
  - **n_crossing_points** computes the number of times a time series crosses the median.
  - **longest_flat_spot** computes the number of sections of the data where the series is relatively unchanging.
  - **stat_arch_lm** returns the statistic based on the Lagrange Multiplier (LM) test of Engle (1982) for autoregressive conditional heteroscedasticity (ARCH).
  - **guerrero** computes the optimal λ value for a Box-Cox transformation using the Guerrero method

