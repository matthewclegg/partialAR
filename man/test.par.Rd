\name{test.par}
\alias{test.par}
\title{Likelihood ratio test for partially autoregressive model}
\description{Likelihood ratio test for partially autoregressive model}
\usage{
test.par(Y, alpha = 0.05, null_hyp = c("rw", "ar1"), 
  ar1test = c("lr", "kpss"), robust = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y}{A numeric vector or a \code{par.fit} object produced by a 
    previous call to \code{\link{fit.par}}}
  \item{alpha}{The critical value to be used in determining whether
    or not to reject the null hypothesis.  See \code{\link{which.hypothesis.partest}}.
    Default: 0.05.}
  \item{null_hyp}{The null hypothesis.  This can be one or both of the following:
    \itemize{
      \item{\code{"rw"}} {Includes the pure random walk as a null hypothesis}
      \item{\code{"ar1"}} {Includes a purely mean-reverting AR(1) series as a null hypothesis}
    }
    Default: Both \code{"rw"} and \code{"ar1"}
  }
  \item{ar1test}{Specifies the type of test to be performed to reject the AR(1)
    null hypothesis.  This can be one of the following:
    \itemize{
    \item{\code{"lr"}} {Likelihood ratio rest}
    \item{\code{"kpss"}} {Unit root test of Kwiatkowski, Phillips, Schmidt and Shin,
      as implemented in the package \code{urca}.}
      }
    Default: \code{"lr"}
  }
  \item{robust}{\code{TRUE} if robust estimation should be used when fitting the models}
}
\details{
The partially autoregressive model is fit to \code{Y} (or a previously fitted model is
re-used if \code{Y} is an object of class \code{par.fit}), representing the alternative
hypothesis.  The null models specified by \code{null_hyp} are also fit.  The likelihood
ratio test is then used to determine whether or not the null model(s) should be rejected.
Statistics are output containing the test results.

If \code{"ar1"} is included in \code{null_hyp} and \code{ar1test = "kpss"}, then the
unit root test of Kwiatkowski, Phillips, Schmidt and Shin is used in place of the
likelihood ratio test to reject the null hypothesis that \code{Y} is a pure AR(1)
sequence.

An example invocation of this function is as follows:

\preformatted{
  > test.par(x)
 
    Test of [Random Walk or AR(1)] vs Almost AR(1) [LR test for AR1]

  data:  x

  Hypothesis              Statistic    p-value
  Random Walk                 -0.62      0.476
  AR(1)                       -0.11      0.062
  Combined                               0.380
}

In this invocation, \code{x} is tested against the null hypothesis that
it is either a pure random walk or a pure AR(1) series.  The test of the
random walk null hypothesis produces a likelihood ratio score of -0.62,
which has a corresponding p-value of 0.476.  The test of the AR(1)
null nypothesis produces a likelihood ratio score of -0.11, which has
a corresponding p-value of 0.062.  The p-value for the combined test
representing the union of these two conditions is 0.38.  Thus, the
null hypothesis cannot be rejected.
}
\value{An object of class \code{"partest"}}
\references{
  Matthew Clegg (2015):
  Modeling Time Series with Both Permanent and Transient Components
  using the Partially Autoregressive Model.
  \emph{Available at SSRN: http://ssrn.com/abstract=2556957}.
  
  Denis Kwiatkowski, Peter C.B. Phillips, Peter Schmidt, and Yongcheol Shin (1992):
  Testing the null hypothesis of stationarity against the alternative 
  of a unit root.
  \emph{Journal of Econometrics}
  54, 159-178.
}
\author{Matthew Clegg \email{matthewcleggphd@gmail.com}}
\seealso{\code{\link{fit.par}} \code{\link{which.hypothesis.partest}}}
\examples{
set.seed(1)
x <- rpar(1000, 0.8, 1, 1)
test.par(x)
}
\keyword{ ts }
\keyword{ models }% __ONLY ONE__ keyword per line
