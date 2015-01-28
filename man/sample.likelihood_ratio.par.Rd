\name{sample.likelihood_ratio.par}
\alias{sample.likelihood_ratio.par}
\title{
Generates random samples of the likelihood ratio for the
partially autoregressive model
}
\description{
Generates random samples of the likelihood ratio for the
partially autoregressive model
}
\usage{
sample.likelihood_ratio.par(n = 500, rho = 0.8, sigma_M = 1, sigma_R = 1, 
  nrep = 1000, use.multicore = TRUE, robust = FALSE, 
  nu = par.nu.default(), seed.start = 0)
}
\arguments{
  \item{n}{Length of the randomly generated sequence.  Possibly a vector.}
  \item{rho}{The coefficient of mean reversion.  Possibly a vector.}
  \item{sigma_M}{Standard deviation of the innovations of the mean-reverting process.
    Possibly a vector.}
  \item{sigma_R}{Standard deviation of the innovations of the random walk process.
    Possibly a vector.}
  \item{nrep}{Number of repetitions to perform}
  \item{use.multicore}{If \code{TRUE}, then the \code{\link{parallel}} package is
    used to speed up processing.}
  \item{robust}{If \code{TRUE}, then sequences containing t-distributed errors are
    generated, and robust fits are performed.  Possibly a vector.}
  \item{nu}{If \code{robust} is \code{TRUE}, then this is the degrees-of-freedom
    parameter to be used.  Possibly a vector.}
  \item{seed.start}{Starting seed to use for the random number generator.}
}
\details{
The purpose of this function is to facilitate studying the behavior of
the \code{fit.par} function by generating random partially autoregressive sequences
and determining the maximum likelihood fits to them.  For each combination of
parameter values given by \code{n}, \code{rho}, \code{sigma_M}, \code{sigma_R},
\code{robust} and \code{nu}, generates \code{nrep} random partially autoregressive
sequences with these parameters.  Then, uses \code{fit.par} to fit the sequence
using the partially autoregressive model, the pure random walk model and the
pure mean reversion model.  Returns a \code{data.frame} containing the results
of the fits.
}
\value{A \code{data.frame} with the following columns
\item{n}{The length of the sequence}
\item{rho}{The value of \code{rho} that was used for generating the sequence}
\item{sigma_M}{The value of \code{sigma_M} that was used for generating the sequence}
\item{sigma_R}{The value of \code{sigma_R} that was used for generating the sequence}
\item{robust}{0 if normally distributed innovations, 1 if t-distributed innovations}
\item{nu}{If t-distributed innovations, the value of the degrees of freedom parameter}
\item{seed}{The value used for seeding the random number generator}
\item{rw_rho}{The value of \code{rho} estimated using the pure random walk model (always 0)}
\item{rw_sigma_M}{The value of \code{sigma_M} estimated using the pure random walk model (always 0)}
\item{rw_sigma_R}{The value of \code{sigma_R} estimated using the pure random walk model}
\item{rw_negloglik}{The negative log likelihood of the fit obtained with the pure random walk model}
\item{mr_rho}{The value of \code{rho} estimated using the pure mean-reversion model}
\item{mr_sigma_M}{The value of \code{sigma_M} estimated using the pure mean-reversion model}
\item{mr_sigma_R}{The value of \code{sigma_R} estimated using the pure mean-reversion model (always 0)}
\item{mr_negloglik}{The negative log likelihood of the fit obtained with the pure mean-reversion model}
\item{par_rho}{The value of \code{rho} estimated using the PAR model}
\item{par_sigma_M}{The value of \code{sigma_M} estimated using the PAR model}
\item{par_sigma_R}{The value of \code{sigma_R} estimated using the PAR model}
\item{par_negloglik}{The negative log likelihood of the fit obtained with the PAR model}
\item{rw_lrt}{The log likelihood ratio of the random walk model vs. the PAR model}
\item{mr_lrt}{The log likelihood ratio of the mean-reversion model vs. the PAR model}
\item{kpss_stat}{Statistic computed by the KPSS test (see \code{\link{ur.kpss}})}
\item{kpss_p}{p-value associated with \code{kpss_stat}}
\item{pvmr}{Proportion of variance attributable to mean reversion found for PAR fit}
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
sample.likelihood_ratio.par(500, c(0.5,0.75), 1, c(1,2),nrep=3)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ts }
\keyword{ models }% __ONLY ONE__ keyword per line
