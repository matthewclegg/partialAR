\name{estimate.par}
\alias{estimate.par}
\title{
Estimates the parameters of a partially autoregressive fit using lagged variances
}
\description{
Estimates the parameters of a partially autoregressive fit using lagged variances
}
\usage{
estimate.par(X, useR = FALSE, rho.max = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{
A numeric vector or \code{zoo} vector representing the time series whose parameters
are to be estimated
}
  \item{useR}{
If \code{TRUE}, the estimation is performed using \code{R} code.  If \code{FALSE}, the
estimation is performed using a faster \code{C++} implementation.  Default: \code{FALSE}.
}
  \item{rho.max}{
An artificial upper bound to be imposed on the value of \code{rho}.
}
}
\details{
The method of lagged variances provides an analytical formula for the parameter
estimates in terms of the variances of the lags \eqn{X[t+1] - X[t]}, 
\eqn{X[t+2] - X[t]} and \eqn{X[t+3] - X[t]}.  Let 
\deqn{V[k] = var(X[t+k] - X[t]).}
Then, the estimated parameter values are given by the following formulas:
\deqn{rho = -(V[1] - 2 V[2] + V[3]) / (2 V[1] - V[2])}
\deqn{sigma_M^2 = (1/2) ((rho + 1)/(rho - 1)) (V[2] - 2 V[1])}
\deqn{sigma_R^2 = (1/2) (V[2] - 2 sigma_M^2)}
}
\value{Returns a numeric vector containing three named components
\item{\code{rho}}{The estimated value of \code{rho}}
\item{\code{sigma_M}}{The estimated value of \code{sigma_M}}
\item{\code{sigma_R}}{The estimated value of \code{sigma_R}}
}
\references{
  Clegg, Matthew.
  Modeling Time Series with Both Permanent and Transient Components
  using the Partially Autoregressive Model.
  \emph{Available at SSRN: http://ssrn.com/abstract=2556957}
}
\author{
Matthew Clegg \email{matthewcleggphd@gmail.com}
}
\seealso{
\code{\link{fit.par}}
}
\examples{
set.seed(1)
x <- rpar(1000, 0.5, 1, 2)  # Generate a random PAR sequence
estimate.par(x)
fit.par(x)  # For comparison
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
\keyword{ts}

