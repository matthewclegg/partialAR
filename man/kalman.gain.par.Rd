\name{kalman.gain.par}
\alias{kalman.gain.par}
\title{
Kalman gain matrix of the partially autoregressive model
}
\description{
Kalman gain matrix of the partially autoregressive model
}
\usage{
kalman.gain.par(rho, sigma_M, sigma_R)
}
\arguments{
  \item{rho}{The coefficient of mean reversion}
  \item{sigma_M}{The standard deviation of the innovations of the mean-reverting component}
  \item{sigma_R}{The standard deviation of the innovations of the random walk component}
}
\details{
The state space representation of the partially autoregressive model
is given as
\preformatted{
    [ M[t] ]     [ rho   0 ] [ M[t-1] ]     [ epsilon_M[t] ]
    [      ]  =  [         ] [        ]  +  [              ]
    [ R[t] ]     [ 0     1 ] [ R[t-1] ]     [ epsilon_R[t] ]
}
where the innovations \code{epsilon_M[t]} and \code{epsilon_R[t]} have
the covariance matrix
\preformatted{
    [ epsilon_M[t] ]      [ sigma_M^2        0 ]
    [              ]  ~   [                    ]
    [ epsilon_R[t] ]      [ 0        sigma_R^2 ]
}
The steady state Kalman gain matrix is given by the matrix
\preformatted{
    [ K_M ]
    [     ]
    [ K_R ]
}
where
\deqn{K_M = 2 sigma_M^2 / (sigma_R * ( sqrt((rho + 1)^2 sigma_R^2 + 4 sigma_M^2)
   + (rho + 1) sigma_R ) + 2 sigma_M^2)}
and \eqn{K_R = 1 - K_M}.
}
\value{
Returns a two-component vector \code{(K_M, K_R)} representing the Kalman gain matrix.
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
kalman.gain.par(0, 1, 0)  # -> c(1, 0)   (pure AR(1))
kalman.gain.par(0, 0, 1)  # -> c(0, 1)   (pure random walk)
kalman.gain.par(0.5, 1, 1)  # -> c(0.3333, 0.6667)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ts }
\keyword{ models }% __ONLY ONE__ keyword per line
