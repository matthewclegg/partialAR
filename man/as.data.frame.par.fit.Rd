\name{as.data.frame.par.fit}
\alias{as.data.frame.par.fit}
\title{
Convert a fit of the PAR model to a single row data.frame
}
\description{
Convert a fit of the PAR model to a single row data.frame
}
\usage{
\method{as.data.frame}{par.fit} (x, row.names, optional, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
An object of class \code{par.fit}.  See \code{\link{fit.par}}
}
\item{row.names}{Not used}
\item{optional}{Not used}
\item{...}{Not used}
}
\value{
Returns a single row data.frame, with the following columns:
\item{robust}{\code{TRUE} if robust estimation was used.}
\item{nu}{If \code{robust} is \code{TRUE}, then this is the degrees-of-freedom parameter
  used in the t-distribution for the robust estimation.}
\item{opt_method}{The optimization method that was used for finding these parameters.}
\item{n}{Length of the vector that was fit to the PAR model}
\item{rho}{Estimate of the coefficient of mean reversion}
\item{sigma_M}{Estimate of the standard deviation of the innovations of
  the transient (mean-reverting) component.}
\item{sigma_R}{Estimate of the standard deviation of the innovations of
  the permanent (random walk) component.}
\item{M0}{Estimate of the initial value of the transient component.}
\item{R0}{Estimate of the initial value of the permanent component.}
\item{rho.se}{Standard error of the estimate of \code{rho}.}
\item{sigma_M.se}{Standard error of the estimate of \code{sigma_M}.}
\item{sigma_R.se}{Standard error of the estimate of \code{sigma_R}.}
\item{M0.se}{Standard error of the estimate of \code{M0}.}
\item{R0.se}{Standard error of the estimate of \code{R0}.}
\item{lambda}{Value of the penalty factor lambda that was used in computing the estimates.}
\item{pvmr}{Proportion of variance attributable to mean reversion.}
\item{negloglik}{Negative log-likelihood of the model given these parameters.}
}
\author{
Matthew Clegg \email{matthewcleggphd@gmail.com}
}
\seealso{
\code{\link{fit.par}}
}
\examples{
\donttest{
    require(TTR)
    L <- getYahooData("L", 20120101, 20131231)$Close
    fit.par(L)
    as.data.frame(fit.par(L))
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}
\keyword{ts}
