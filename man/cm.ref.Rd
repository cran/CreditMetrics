\name{cm.ref}
\alias{cm.ref}

\title{Computation of reference value}

\description{
\code{cm.ref} computes the value of a credit in one year for each rating, this is
the return value \code{constVal}. Further the portfolio value at time t = 1 is
computed, this is \code{constPV}.
}

\usage{
cm.ref(M, lgd, ead, r, rating)
}

\arguments{
  \item{M}{one year empirical migration matrix, where the last row gives the
           default class.}
  \item{lgd}{loss given default}
  \item{ead}{exposure at default}
  \item{r}{riskless interest rate}
  \item{rating}{rating of companies}
}

\details{
This function computes the value of the credit in one year, this is
\deqn{V_t = EAD_t e^{-(r_t + CS_t) t}}
where t = 1.
}

\value{
a list containing following components:
  \item{constVal}{credit value in one year}
  \item{constPV}{portfolio of all credit values in one year}
}

\references{ Glasserman, Paul, Monte Carlo Methods in Financial Engineering, Springer 2004 }

\author{Andreas Wittmann \email{andreas\_wittmann@gmx.de}}

\seealso{\code{\link{cm.matrix}}, \code{\link{cm.cs}}}

\examples{
  r <- 0.03
  ead <- c(4000000, 1000000, 10000000)
  rating <- c("BBB", "AA", "B")
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

  cm.ref(M, lgd, ead, r, rating)
}

\keyword{models}
