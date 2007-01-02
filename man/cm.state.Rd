\name{cm.state}
\alias{cm.state}

\title{Computation of state space}

\description{
\code{cm.state} computes a state space, this is at time t = 1 the credit positions
of all companies for all migrations is calculated. This state space is needed for
the later valuation for the credit positions of each scenario.
}

\usage{
cm.state(M, lgd, ead, N, r)
}

\arguments{
  \item{M}{one year empirical migration matrix, where the last row gives the
           default class.}
  \item{lgd}{loss given default}
  \item{ead}{exposure at default}
  \item{N}{number of companies}
  \item{r}{riskless interest rate}
}

\details{
This function computes the value of the credits of each firm in one year, this is
\deqn{V_t = EAD_t e^{-(r_t + CS_t) t}}
where t = 1. Also the value for the default class is calculated, that is
\deqn{V_t = EAD (1 - LGD)}
}

\value{
Return value is the matrix \code{V} for time t = 1 of each rating in the migration
matrix including the credit values for all companies. The last column in the matrix
\code{V} is the value for the default event of each company.
}

\references{ Glasserman, Paul, Monte Carlo Methods in Financial Engineering, Springer 2004 }

\author{Andreas Wittmann \email{andreas\_wittmann@gmx.de}}

\seealso{\code{\link{cm.matrix}}, \code{\link{cm.cs}}, \code{\link{matrix}}}

\examples{
  N <- 3
  r <- 0.03
  ead <- c(4000000, 1000000, 10000000)
  lgd <- 0.45

  # one year empirical migration matrix from standard&poors website
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

  cm.state(M, lgd, ead, N, r)
}

\keyword{models}
