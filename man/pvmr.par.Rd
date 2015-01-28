\name{pvmr.par}
\alias{pvmr.par}
\title{
Proportion of variance attributable to mean reversion
}
\description{
Proportion of variance attributable to mean reversion of a partially autoregressive model
}
\usage{
pvmr.par(rho, sigma_M, sigma_R)
}
\arguments{
  \item{rho}{The coefficient of mean reversion}
  \item{sigma_M}{The standard deviation of the innovations of the mean-reverting component}
  \item{sigma_R}{The standard deviation of the innovations of the random walk component}
}
\details{
This routine determines the proportion of variance attributable to mean reversion for
a partially autoregressive model.  The partially autoregressive model is given by the 
specification:

\deqn{X_t = M_t + R_t}{X[t] = M[t] + R[t]}
\deqn{M_t = \rho M_{t-1} + \epsilon_{M,t}}{M[t] = rho * M[t-1] + epsilon_M[t]}
\deqn{R_t = R_{t-1} + \epsilon_{R,t}}{R[t] = R[t-1] + epsilon_R[t]}
\deqn{-1 < \rho < 1}{-1 < rho < 1}

The proportion of variance attributable to mean reversion is defined as
\deqn{R^2[MR] = Var((1 - B) M[t]) / Var((1 - B) X[t])}
where \code{M[t]} is the mean-reverting component of the system at time \code{t},
\code{X[t]} is the state of the entire system at time \code{t}, and
\code{B} is the backshift operator.

It will be a value between zero and one, with zero indicating that none of the
variance is attributable to the mean reverting component, and one indicating that
all of the variance is attributable to the mean-reverting component.

In the case of the partially autoregressive model, the proportion of variance
attributable to mean reversion is given by the following formula:

\deqn{R^2[MR] = 2 sigma_M^2 / (2 sigma_M^2 + (1 + rho) sigma_R^2)}
}
\value{
Returns the proportion of variance attributable to mean reversion for 
the parameter values \code{(rho, sigma_M, sigma_R)}.}
\references{
  Clegg, Matthew.
  Modeling Time Series with Both Permanent and Transient Components
  using the Partially Autoregressive Model.
  \emph{Available at SSRN: http://ssrn.com/abstract=2556957}
}
\author{Matthew Clegg \email{matthewcleggphd@gmail.com}}
\seealso{\code{\link{fit.par}}}
\examples{
pvmr.par(0,0,1)  # -> 0
pvmr.par(0,1,0)  # -> 1
pvmr.par(0,1,1)  # -> 0.6667
pvmr.par(0.5,1,1) # -> 0.5714
pvmr.par(0.5,1,2) # -> 0.25
}
\keyword{ ts }
\keyword{ models }% __ONLY ONE__ keyword per line
