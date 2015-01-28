\name{statehistory.par}
\alias{statehistory.par}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Estimates hidden states of a partially autoregressive model
}
\description{
Estimates hidden states of a partially autoregressive model
}
\usage{
statehistory.par(A, data = A$data)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{A}{A \code{par.fit} object returned from a previous call to \code{\link{fit.par}}}
  \item{data}{A sequence of observed states}
}
\details{Based on the parameters of the model fitted by the previous call to 
\code{\link{fit.par}}, produces a \code{data.frame} containing the inferred
hidden states of the process.
}
\value{
A \code{data.frame} with one row for each observation in \code{data}.
The columns in the \code{data.frame} are as follows:
\item{X}{Value of the observed state (\code{data}) at this time}
\item{M}{Estimated value of the mean-reverting component at this time}
\item{R}{Estimated value of the random walk component at this time}
\item{eps_M}{Estimated innovation to the mean-reverting component}
\item{eps_R}{Estimated innovation to the random walk component}
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
# A simple example to compare the fitted values of the mean-reverting
# component with the actual data
set.seed(1)
xactual <- rpar(1000, 0.9, 2, 1, include.state=TRUE)
xfit <- fit.par(xactual$X)
xstates <- statehistory.par(xfit)
summary(lm(xstates$M ~ xactual$M))

\dontrun{
    require(ggplot)
    xdf <- rbind(data.frame(data="actual", x=1:nrow(xactual), value=xactual$M), 
      data.frame(data="fitted", x=1:nrow(xstates), value=xstates$M))
    ggplot(xdf, aes(x=x, y=value, colour=data)) + geom_line()
}}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ts }
\keyword{ models }% __ONLY ONE__ keyword per line
