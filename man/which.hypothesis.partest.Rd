\name{which.hypothesis.partest}
\alias{which.hypothesis.partest}
\title{Returns the preferred hypothesis when testing for partial autoregression}
\description{Returns the preferred hypothesis when testing for partial autoregression}
\usage{which.hypothesis.partest(AT)}
\arguments{
  \item{AT}{An object of class \code{"partest"} returned from a previous
    call to \code{\link{test.par}}.}
}
\details{
Based upon the critical value \code{alpha} used in the call to \code{test.par},
and based upon the statistics computed by \code{test.par}, selects a preferred
explanatory hypothesis for the data and returns a string representing the chosen
hypothesis.
}
\value{One of the following strings:
\item{"RW"}{The preferred hypothesis is a pure random walk}
\item{"AR1"}{The preferred hypothesis is a pure AR(1) series}
\item{"PAR"}{The preferred hypothesis is a partially autoregressive series}
\item{"RRW"}{The preferred hypothesis is a random walk with t-distributed innovations}
\item{"RAR1"}{The preferred hypothesis is a pure AR(1) series with t-distributed innovations}
\item{"RPAR"}{The preferred hypothesis is a partially autoregressive model with
  t-distributed innovations}
}
\references{
  Matthew Clegg (2015):
  Modeling Time Series with Both Permanent and Transient Components
  using the Partially Autoregressive Model.
  \emph{Available at SSRN: http://ssrn.com/abstract=2556957}.
  
}
\author{Matthew Clegg \email{matthewcleggphd@gmail.com}}
\seealso{\code{\link{fit.par}} \code{\link{test.par}}}
\examples{
set.seed(1)
which.hypothesis.partest(test.par(rpar(1000, 0, 1, 0)))  # -> "AR1"
which.hypothesis.partest(test.par(rpar(1000, 0, 0, 1)))  # -> "RW"
which.hypothesis.partest(test.par(rpar(1000, 0, 1, 1)))  # -> "PAR"

which.hypothesis.partest(test.par(rpar(1000, 0, 1, 0), robust=TRUE))   # -> "RAR1"
which.hypothesis.partest(test.par(rpar(1000, 0, 0, 1), robust=TRUE))   # -> "RRW"
which.hypothesis.partest(test.par(rpar(1000, 0.5, 1, 1), robust=TRUE)) # -> "RPAR"
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ts }
\keyword{ models }