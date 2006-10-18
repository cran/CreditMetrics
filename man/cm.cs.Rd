\name{cm.cs}
\alias{cm.cs}

\title{Computation of credit spreads}

\description{
\code{cm.cs} computes the credit spreads for each rating of a one year empirical
migration matrix. The failure limit is the quantile of the failure probability.
}

\usage{
cm.cs(M, lgd)
}

\arguments{
  \item{M}{one year empirical migration matrix, where the last row gives the
           default class.}
  \item{lgd}{loss given default}
}

\details{
This function computes the credit spreads for each rating of a given one year
empirical migration matrix with a default class in the last row. The credit spread
is the risk premium demanded by the market.

According migration the nominal is differently calculated
\deqn{V_0 = V_t e^{-(r_t + CS_t) t}}
where t is the time. Under a riskless probability measure the value of a credit
position at time t is computed as
\deqn{V_0 = E[V_t] e^{-r_t t}}
The default event is bernoulli distributed, so the expected value is
\deqn{E[V_t] = V_t (1 - PD_t) + V_t (1 - LGD) PD_t}
By using the above equations and following transforming we get the formula for
the credit spread
\deqn{CS_t = - (\ln(1 - LGD PD_t)) / t}
This function computes the credit spread for t = 1, this is the credit spread for
one year is calculated.
}

\value{
Return value is the credit spread for time t = 1 of each rating in the migration matrix.
}

\references{ Glasserman, Paul, Monte Carlo Methods in Financial Engineering, Springer 2004 }

\author{ Andreas Wittmann \email{andreas\_wittmann@gmx.de}}}

\seealso{\code{\link{cm.matrix}}}

\examples{
  lgd <- 0.45
  
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

  cm.cs(M, lgd)
}

\keyword{models}
