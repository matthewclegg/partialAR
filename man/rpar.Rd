\name{rpar}
\alias{rpar}
\title{Random partially autoregressive sequence}
\description{Random partially autoregressive sequence}
\usage{
rpar(n, rho, sigma_M, sigma_R, M0 = 0, R0 = 0, 
  include.state = FALSE, robust = FALSE, nu = par.nu.default())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n}{Length of sequence to generate}
  \item{rho}{The coefficient of mean reversion}
  \item{sigma_M}{The standard deviation of the innovations of the mean-reverting component}
  \item{sigma_R}{The standard deviation of the innovations of the random walk component}
  \item{M0}{Initial state of mean-reverting component}
  \item{R0}{Initial state of random walk component}
  \item{include.state}{If \code{TRUE}, a \code{data.frame} is returned containing the states
    of the mean-reverting and random walk components.  Otherwise, a numeric vector is
    returned containing the state of the system.  Default: \code{FALSE}.}
  \item{robust}{If TRUE, innovations are t-distributed.  Otherwise, they are
    normally distributed.  Default: \code{FALSE}.}
  \item{nu}{If \code{robust} is \code{TRUE}, then this is the degrees of freedom parameter
    to be used in the t-distributed innovations.}
}
\details{
Generates a random sequence according to the specification of the partially
autoregressive model.  The partially autoregressive model is given as
\deqn{X_t = M_t + R_t}{X[t] = M[t] + R[t]}
\deqn{M_t = \rho M_{t-1} + \epsilon_{M,t}}{M[t] = rho * M[t-1] + epsilon_M[t]}
\deqn{R_t = R_{t-1} + \epsilon_{R,t}}{R[t] = R[t-1] + epsilon_R[t]}
\deqn{-1 < \rho < 1}{-1 < rho < 1}

To generate the random sequence, the sequences \code{epsilon_M[t]} and
\code{epsilon_R[t]} are first generated.  These are then used to build up
the sequences \code{M[t]}, \code{R[t]} and \code{X[t]}.
}
\value{
If \code{include.state} is \code{FALSE}, then returns the sequence \code{X[t]}.
Otherwise, returns a \code{data.frame} with the following columns:
\item{X}{State of the system}
\item{M}{State of the mean-reverting component}
\item{R}{State of the random walk component}
\item{eps_M}{Innovations in the mean-reverting component}
\item{eps_R}{Innovations in the random walk component}
}
\references{
  Clegg, Matthew.
  Modeling Time Series with Both Permanent and Transient Components
  using the Partially Autoregressive Model.
  \emph{Available at SSRN: http://ssrn.com/abstract=2556957}
}
\author{Matthew Clegg \email{matthewcleggphd@gmail.com}}
\seealso{\code{\link{fit.par}}}
\examples{
set.seed(1)
x <- rpar(10000, 0.5, 2, 1)
library(tseries)
adf.test(x)      # Seems to contain a unit root, as expected
estimate.par(x)  # Estimate parameters using lagged variances
fit.par(x)       # Maximum likelihood estimate
}
\keyword{ ts }
\keyword{ models }% __ONLY ONE__ keyword per line
