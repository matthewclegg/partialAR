\name{partialAR-package}
\alias{partialAR-package}
\alias{partialAR}
\docType{package}
\title{
Partial autoregression
}
\description{
Fits time series models which consist of a sum of a permanent and a transient component.
The permanent component is modeled as a random walk, while the transient component
is modeled as an autoregressive series of order one.
}
\details{
\tabular{ll}{
Package: \tab partialAR\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2015-01-12\cr
License: \tab GPL-2 | GPL-3\cr
}
This package fits time series models which consist of a sum of a permanent and
a transient component.  In other words, the model fitted is:

\deqn{X_t = M_t + R_t}{X[t] = M[t] + R[t]}
\deqn{M_t = \rho M_{t-1} + \epsilon_{M,t}}{M[t] = rho * M[t-1] + epsilon_M[t]}
\deqn{R_t = R_{t-1} + \epsilon_{R,t}}{R[t] = R[t-1] + epsilon_R[t]}
\deqn{-1 < \rho < 1}{-1 < rho < 1}
\deqn{\epsilon_{M,t} \sim N(0,\sigma_M^2)}{epsilon_M[t] ~ N(0, sigma_M^2)}
\deqn{\epsilon_{R,t} \sim N(0,\sigma_R^2)}{epsilon_R[t] ~ N(0, sigma_R^2)}

This model may be useful when modeling a time series that is thought to be
primarily mean-reverting but which may also contain some random drift.
}
\author{
Matthew Clegg

Maintainer: Matthew Clegg <matthewcleggphd@gmail.com>
}
\section{Disclaimer}{
DISCLAIMER: The software in this package is for general information purposes
only. It is hoped that it will be useful, but it is provided WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. It is not intended to form the basis of any investment
decision. USE AT YOUR OWN RISK!
}  
\references{
  Summers, Lawrence H.
  Does the stock market rationally reflect fundamental values?
  \emph{Journal of Finance}, 41(3), 591-601.
  
  Poterba, James M. and Lawrence H. Summers.
  Mean reversion in stock market prices:  Evidence and implications.
  \emph{Journal of Financial Economics}, 22(1), 27-59.
  
  Clegg, Matthew.
  Modeling Time Series with Both Permanent and Transient Components
  using the Partially Autoregressive Model.
  \emph{Available at SSRN: http://ssrn.com/abstract=2556957}
}
\keyword{ package }
\seealso{
\code{\link[stats:arima]{arima}} ARIMA modeling of time series

\code{\link[egcm:egcm]{egcm}} Engle-Granger cointegration model
}
\examples{

    set.seed(1)
    x <- rpar(1000, 0.8, 1, 0.5)  # Generate a random PAR sequence
    fit.par(x)                  # Estimate its parameters
    plot(fit.par(x))            # Plot the estimate
    test.par(x)                 # Test the goodness of fit

\donttest{
    # An example involving European stock market data
    data(EuStockMarkets)   # European Stock Markets 1991-1998
    
    # Check for cointegration between German DAX and Swiss SMI
    library(egcm)
    egcm(log(EuStockMarkets[,c("DAX", "SMI")]))
    
    # The series are not found to be cointegrated.
    # Perhaps they are partially cointegrated?  Check the residuals
    # of the cointegration fit for partial autoregression:
    fit.par(egcm(EuStockMarkets[,c("DAX", "SMI")])$residuals)
    
    # A plot of the model looks promising:
    \dontrun{plot(fit.par(egcm(EuStockMarkets[,c("DAX", "SMI")])$residuals))}
    
    # 74% of the variance is attributed to a mean-reverting
    # AR(1) process.  However, it is important to check whether this is
    # a better explanation than a simple random walk:
    test.par(egcm(EuStockMarkets[,c("DAX", "SMI")])$residuals)
    
    # The p-value is found to be 0.36, so the random walk hypothesis
    # cannot be rejected.
    
    # Another example involving a potential pairs trade between
    # Coca-Cola and Pepsi.
    
    # Fetch the price series for Coca-Cola (KO) and Pepsi (PEP) in 2014
    library(TTR)
    KO <- getYahooData("KO", 20140101, 20141231)$Close
    PEP <- getYahooData("PEP", 20140101, 20141231)$Close
    
    # Check whether they were cointegrated
    egcm(KO,PEP)
    
    # It turns out that they are not cointegrated.  Perhaps a better
    # fit can be obtained with the partially autoregressive model:
    fit.par(egcm(KO,PEP)$residuals)
    
    # The mean-reverting component of the above fit explains 90% of
    # the variance of the daily returns.  Thus, it appears that the
    # two series are close to being cointegrated.  A plot further
    # confirms this:
    plot(fit.par(egcm(KO,PEP)$residuals))
    
    # Still, it is important to check whether or not the residual
    # series is simply a random walk:
    test.par(egcm(KO,PEP)$residuals)
    
    # In this case, the p-value associated with the hypothesis that
    # the series is partially autoregressive is 0.12.  Thus, the
    # evidence of partial autoregression is marginal. The random walk
    # may be a better explanation.   
}
}
