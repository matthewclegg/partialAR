\name{likelihood_ratio.par}
\alias{likelihood_ratio.par}
\title{Computes log likelihood ratio for partial autoregressive model}
\description{Computes the log likelihood ratio for the partially autoregressive model.

First, a fit is performed for the specified null model.  Then, a fit is 
performed for the alternative model that the sequence is partially autoregressive.
The likelihood scores are computed for both models, and the log likelihood
ratio is returned.}
\usage{
likelihood_ratio.par(X, robust = FALSE, null_model = c("rw", "ar1"), 
  opt_method = c("css", "kfas", "ss"), nu = par.nu.default())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{The numeric vector or zoo vector to which the partially autoregressive
           model is being fit.}
  \item{robust}{If \code{TRUE}, then errors are assumed to follow a t-distribution
    with \code{nu} degrees of freedom.  If \code{FALSE}, then errors are assumed
    to follow a normal distribution.  Default: \code{FALSE}}
  \item{null_model}{Specifies the null hypothesis:
  \itemize{\item{"rw"} {Pure random walk (e.g., \code{sigma_M = 0})}
           \item{"ar1"} {Pure autoregressive (e.g., \code{sigma_R = 0})}}
  Default: \code{"rw"}}
  \item{opt_method}{The method to be used for calculating the negative log likelihood.
\itemize{
\item \code{"ss"} Steady-state Kalman filter with normally distributed errors
\item \code{"css"} Steady-state Kalman filter with normally distributed errors,
  coded in C++
\item \code{"kfas"} Traditional Kalman filter of the \code{\link{KFAS}} package
}
Default: \code{"css"}}
  \item{nu}{If \code{robust} is \code{TRUE}, this specifies
  the number of degrees of freedom of the t-distribution.  Default: 5}
}
%% \details{
%%  ~~ If necessary, more details than the description above ~~
%% }
\value{A numeric value representing the log likelihood ratio}
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
%%}
\references{
  Clegg, Matthew.
  Modeling Time Series with Both Permanent and Transient Components
  using the Partially Autoregressive Model.
  \emph{Available at SSRN: http://ssrn.com/abstract=2556957}
}
\author{Matthew Clegg \email{matthewcleggphd@gmail.com}}
\seealso{\code{\link{fit.par}}}
%% \examples{
%%}
\keyword{ ts }
\keyword{ models }
