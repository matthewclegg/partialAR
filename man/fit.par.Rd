\name{fit.par}
\alias{fit.par}
\title{
Fit a partially autoregressive model
}
\description{
Fit a partially autoregressive model
}
\usage{
fit.par(Y, 
  robust = FALSE, 
  model = c("par", "ar1", "rw"), 
  lambda = 0, 
  opt_method = c("css", "kfas", "ss"), 
  rho.max = 1, 
  nu = par.nu.default())
}
\arguments{
  \item{Y}{
A numeric vector or \code{zoo} vector representing the time series whose parameters
are to be estimated
}
  \item{robust}{
If \code{TRUE}, then the error terms in the fit are assumed to follow a Student's 
t-distribution with degrees of freedom parameter given by \code{nu}.  Otherwise,
the error terms are assumed to be normally distributed.  Default: \code{FALSE}.
}
  \item{model}{
Specifies the model that is to be fit.  Possible values are
\itemize{
\item "par" The partially autoregressive model is fit.
\item "ar1" An autoregressive model of order one is fit.
\item "rw"  A random walk is fit.
}
Default: \code{par}
}
  \item{lambda}{
A penalty term \eqn{lambda sigma_R^2} is added to the likelihood function.
Default: \eqn{lambda = 0.}
}
  \item{opt_method}{
Specifies the Kalman filter that will be used for optimization:
\itemize{
\item "ss" Steady-state Kalman filter
\item "css" Steady-state Kalman filter coded in C++
\item "kfas" Kalman filter implementation of the KFAS package
}
Default: \code{css}
}
  \item{rho.max}{
Specifies an upper limit on the value of \code{rho} that will
be returned.
}
  \item{nu}{
If \code{robust} is \code{TRUE}, this specifies the value of the
degrees-of-freedom parameter used by the t-distribution.  
Default: 5
}
}
\details{
This routine determines the maximum likelihood fit of a time series
to the partially autoregressive model, which is given by the 
specification:

\deqn{X_t = M_t + R_t}{X[t] = M[t] + R[t]}
\deqn{M_t = \rho M_{t-1} + \epsilon_{M,t}}{M[t] = rho * M[t-1] + epsilon_M[t]}
\deqn{R_t = R_{t-1} + \epsilon_{R,t}}{R[t] = R[t-1] + epsilon_R[t]}
\deqn{-1 < \rho < 1}{-1 < rho < 1}
\deqn{\epsilon_{M,t} \sim N(0,\sigma_M^2)}{epsilon_M[t] ~ N(0, sigma_M^2)}
\deqn{\epsilon_{R,t} \sim N(0,\sigma_R^2)}{epsilon_R[t] ~ N(0, sigma_R^2)}

The partially autoregressive model is a candidate for working with time series 
having both permanent and transient
components.

If \code{robust} is \code{TRUE}, then a form of robust estimation is used.
The error term is assumed to follow a Student's t-distribution with
\code{nu} degrees of freedom.

The \code{model} parameter is used to alter the model that is fit.
If \code{model} is \code{"par"}, then the partially autoregressive model
is fit.  If \code{model} is \code{"ar1"}, then an AR(1) model is fit.
This is performed by fitting the partially autoregressive model with
the restriction that \eqn{sigma_R = 0}.  If \code{model} is \code{"rw"},
then a random walk model is fit.  This is performed by fitting the
partially autoregressive model with the restriction that \eqn{sigma_M = 0}.

The parameter \code{lambda} specifies the weighting of a penalty term that is added
to the likelihood function.
When \eqn{lambda > 0}, this drives the optimizer towards a solution 
that places a greater weight on the transient (mean-reverting) component, and 
when \eqn{lambda < 0}, this drives the optimizer towards a solution that
places a greater weight on the permanent (random walk) component.

The fit is performed using maximum likelihood estimation for a 
Kalman filter representation of the model.  When \code{opt_method} is
\code{"ss"} or \code{"css"}, a steady-state Kalman filter is used.
These two methods should give the same result, although \code{"css"} is
to be preferred because the implementation is much faster.  When \code{opt_method}
is \code{"kfas"}, the KFAS Kalman Filter package \code{\link{KFAS}} is used.
Because the Kalman gain matrix takes some time to converge to its steady state
value, the \code{"kfas"} implementation will yield values that are close to
but not the same as those of \code{"ss"} and \code{"css"}.

This routine prints the model that is found.  
The following is an example of the output obtained in one 
particular run:
\preformatted{
  Fitted model:
    X[t] = M[t] + R[t]
    M[t] = 0.9427 M[t-1] + eps_M,t,  eps_M,t ~ N(0, 0.8843^2)
          (0.0302)                                 (0.0685)
    R[t] = R[t-1] + eps_R,t,         eps_R,t ~ N(0, 0.2907^2)
                                                   (0.1710)
    M_0 = 0.0000, R_0 = -5.2574
             (NA)       (0.9625)
  Proportion of variance attributable to mean reversion (pvmr) = 0.9050
  Negative log likelihood = 339.51
}

In this ouptut, the coefficient of mean reversion \code{rho} is
found to be 0.9427 with a standard error of 0.0302.  This corresponds
to a half-life of mean reversion of log(0.5)/log(0.9427) = 11.7 days.
The parameter \code{sigma_M} is found to be 0.8843 with a standard error 0.0685.
The parameter \code{sigma_R} is found to be 0.2907 with a 
standard error of 0.1710.  The parameters \code{M[0]} and \code{R[0]}
are 0.0 and -5.2574, respectively.

An important measure of the quality of fit of the partially autoregressive
model is the proportion of variance attributable to mean reversion.
This is a number between zero and one.  When it is zero, the best fit
is a pure random walk, and when it is one, the best fit is a pure
mean-reverting series.  In this case, it is found to be 0.9050, indicating
that the mean-reverting component dominates.

The negative log likelihood of this particular fit is 339.51.

A \code{plot} method is available for plotting the fit, and the
\code{\link{test.par}} method is available for testing the null hypotheses
that an adequate fit can be obtained with a pure random walk or pure
autoregressive series.
}
\value{
An S3 object of class \code{fit.par} is returned.  The object
contains the following values:
\item{\code{data}}{ The input vector \code{Y}}
\item{\code{robust}}{ The input parameter \code{robust}}
\item{\code{nu}}{ The input parameter \code{nu}}
\item{\code{model}}{ The input parameter \code{model}}
\item{\code{lambda}}{ The input parameter \code{lambda}}
\item{\code{opt_method}}{ The input parameter \code{opt_method}}
\item{\code{rho.max}}{ The input parameter \code{rho.max}}
\item{\code{rho}}{ The estimate of the parameter \code{rho}}
\item{\code{sigma_M}}{ The estimate of the parameter \code{sigma_M}}
\item{\code{sigma_R}}{ The estimate of the parameter \code{sigma_R}}
\item{\code{M0}}{ The estimate of the parameter \code{M[0]}}
\item{\code{R0}}{ The estimate of the parameter \code{R[0]}}
\item{\code{par}}{ The vector \code{(rho, sigma_M, sigma_R, M0, R0)}}
\item{\code{stderr}}{ The vector of standard errors }
\item{\code{negloglik}}{ The negative of the log likelihood score for these parameters}
\item{\code{pvmr}}{ The proportion of variance attributable to mean reversion (see \link{pvmr.par})}
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
\author{
Matthew Clegg \email{matthewcleggphd@gmail.com}
}
\section{Disclaimer}{
DISCLAIMER: The software in this package is for general information purposes
only. It is hoped that it will be useful, but it is provided WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. It is not intended to form the basis of any investment
decision. USE AT YOUR OWN RISK!
}  
\seealso{
\code{\link[stats:arima]{arima}} ARIMA modeling of time series

\code{\link[egcm:egcm]{egcm}} Engle-Granger cointegration model
}
\examples{

    set.seed(1)
    x <- rpar(1000, 0.8, 1, 0.5)  # Generate a random PAR sequence
    fit.par(x)                  # Estimate its parameters
    \dontrun{plot(fit.par(x)}   # Plot the estimate
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
}
    
\donttest{
    # Another example involving a potential pairs trade between
    # Coca-Cola and Pepsi.
    
    # Fetch the price series for Coca-Cola (KO) and Pepsi (PEP) in 2014
    library(TTR)
    KO <- getYahooData("KO", 20140101, 20141231)$Close
    PEP <- getYahooData("PEP", 20140101, 20141231)$Close
    
    # Check whether they were cointegrated
    library(egcm)
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
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ts }
\keyword{ models }

