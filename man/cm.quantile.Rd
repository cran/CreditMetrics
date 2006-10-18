\name{cm.quantile}
\alias{cm.quantile}

\title{Computation of migration quantils}

\description{
\code{cm.quantile} computes the empirical migration quantils for each rating
of a one year empirical migration matrix. The failure limit is the quantile
of the failure probability.
}

\usage{
cm.quantile(M)
}

\arguments{
  \item{M}{one year empirical migration matrix, where the last row gives the
           default class.}
}

\details{
This function computes the empirical migration threshold value of a given one year
empirical migration matrix with a default class in the last row. So the migration
threshold can be computed with the migration probabilities. Migration quantiles have
to be computed for each output rating.

The default threshold value S of the standard normal distribution with expectation
0 and standard deviation 1 gives
\deqn{S = N^{-1}(PD)}
where \eqn{N^{-1}} is the inverse function of the standard normal distribution and
PD is the probability of default.

Thus an example for an BBB rated company is
\deqn{S = N^{-1}(PD_{BBB})}
So for each rating class thresholds can be computed.
}

\value{
Return value is the quantile of each rating in the migration matrix.
}

\references{ Glasserman, Paul, Monte Carlo Methods in Financial Engineering, Springer 2004 }

\author{ Andreas Wittmann \email{andreas\_wittmann@gmx.de}}}

\seealso{\code{\link{cm.matrix}}, \code{\link{qnorm}}}

\examples{
  # one year empirical migration matrix form standard&poors website
  rc <- c("AAA", "AA", "A", "BBB", "BB", "B", "CCC", "D")
  M <- matrix(c(90.81,  8.33,  0.68,  0.06,  0.08,  0.02,  0.01,   0.01,
                 0.70, 90.65,  7.79,  0.64,  0.06,  0.13,  0.02,   0.01,
                 0.09,  2.27, 91.05,  5.52,  0.74,  0.26,  0.01,   0.06,
                 0.02,  0.33,  5.95, 85.93,  5.30,  1.17,  1.12,   0.18,
                 0.03,  0.14,  0.67,  7.73, 80.53,  8.84,  1.00,   1.06,
                 0.01,  0.11,  0.24,  0.43,  6.48, 83.46,  4.07,   5.20,
                 0.21,     0,  0.22,  1.30,  2.38, 11.24, 64.86,  19.79,
                    0,     0,     0,     0,     0,     0,     0, 100
              )/100, 8, 8, dimnames = list(rc, rc), byrow = TRUE)

  cm.quantile(M)
}

\keyword{models}
