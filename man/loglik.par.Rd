\name{loglik.par}
\alias{loglik.par}
\title{
Negative log likelihood of a partially autoregressive fit
}
\description{
Negative log likelihood of a partially autoregressive fit
}
\usage{
loglik.par(Y, rho, sigma_M, sigma_R, M0 = 0, R0 = Y[1], 
  calc_method = c("css", "kfas", "ss", "sst", "csst"), 
  nu = par.nu.default())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y}{A numeric vector representing the time series to which the partially
autoregressive model is being fit.}
  \item{rho}{The coefficient of mean reversion}
  \item{sigma_M}{Standard deviation of the innovations of the mean-reverting process}
  \item{sigma_R}{Standard deviation of the innovations of the random walk process}
  \item{M0}{Initial value of the mean-reverting process}
  \item{R0}{Initial value of the random walk process}
  \item{calc_method}{The method to be used for calculating the negative log likelihood.
\itemize{
\item \code{"ss"} Steady-state Kalman filter with normally distributed errors
\item \code{"css"} Steady-state Kalman filter with normally distributed errors,
  coded in C++
\item \code{"kfas"} Traditional Kalman filter of the \code{\link{KFAS}} package
\item \code{"sst"} Steady-state Kalman filter with t-distributed errors
\item \code{"csst"} Steady-state Kalman filter with t-distributed errors,
  coded in C++
}
Default: \code{"css"}}
  \item{nu}{If \code{calc_method} is \code{"sst"} or \code{"csst"}, this specifies
  the number of degrees of freedom of the t-distribution.}
}
%% \details{
%%  ~~ If necessary, more details than the description above ~~
%% }
\value{
Returns the negative log likelihood of fitting the partially autoregressive
model with parameters \code{(rho, sigma_M, sigma_R, M0, R0)} to the data
series \code{Y}.}
\references{
  Clegg, Matthew.
  Modeling Time Series with Both Permanent and Transient Components
  using the Partially Autoregressive Model.
  \emph{Available at SSRN: http://ssrn.com/abstract=2556957}
}
\author{Matthew Clegg \email{matthewcleggphd@gmail.com}}
\seealso{\code{\link{fit.par}}}
\examples{
loglik.par(0,0,0,1)  # -> same as -log(dnorm(0))
loglik.par(0,0,1,0)  # -> same as -log(dnorm(0))
loglik.par(0,0,1,1)  # -> same as -log(dnorm(0,0,sqrt(2)))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ts }
\keyword{ models }% __ONLY ONE__ keyword per line
