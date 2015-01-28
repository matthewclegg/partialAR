# partialAR
R package for fitting the partially autoregressive model

The partially autoregressive model is a time series model that is given
by the following specification:

```
   X[t] = M[t] + R[t]
   M[t] = rho * M[t-1] + epsilon_M[t]
   R[t] = R[t-1] + epsilon_R[t]
   epsilon_M[t] ~ NID(0, sigma_M^2)
   epsilon_R[t] ~ NID(0, sigma_R^2)
```

Thus, the series X[t] is a sum of a random walk R[t],  representing the 
permanent component, and a mean-reverting series M[t], representing the 
transient component. 

This model was previously studied  in Summers [1] and also in Poterba and 
Summers [2] in their often cited work on mean reversion in the S&P 500.

One example application of the partially autoregressive model is as follows.
In the calendar year 2014, the behavior of Coca-Cola (KO) and Pepsi (PEP)
were quite similar, as evidenced by charts of their stock prices.  Despite this,
cointegration tests find that they were not cointegrated.  Thus, the question arises,
"How far were they from being cointegrated?"  The partially autoregressive
model gives a possible answer to this question.  When a partially autoregressive
model is fit, it is found that 90% of the variance of the daily fluctuations of the residual
series is due to a transient mean-reverting component, while 10% of the variance 
is due to a permanent random walk component.

The partialAR package provides routines for estimating the
parameters of a partially autoregressive model and for testing
goodness of fit.

A companion paper [3] can be found on SSRN.

[1] Summers, Lawrence H. 
  Does the stock market rationally reflect fundamental values?. 
  The Journal of Finance 41.3 (1986): 591-601.

[2] Poterba, James M., and Lawrence H. Summers. 
  Mean reversion in stock prices: Evidence and implications. 
  Journal of Financial Economics} 22.1 (1988): 27-59.

[3] Clegg, Matthew. 
  Modeling Time Series with Both Permanent and Transient Components 
  Using the Partially Autoregressive Model (January 28, 2015). 
  Available at SSRN: http://ssrn.com/abstract=2556957

