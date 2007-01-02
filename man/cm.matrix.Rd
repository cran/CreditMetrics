\name{cm.matrix}
\alias{cm.matrix}

\title{Testing for migration matrix}

\description{
\code{cm.matrix} tests if the given matrix \code{M} is a migration matrix. So 
the dimensions of the migration matrix should be at least 2 times 2 and the
row and column dimensions must be equal. Further the values in the migration
matrix should be between 0 and 1. And the sum of each row should be 1.
}

\usage{
cm.matrix(M)
}

\arguments{
  \item{M}{one year empirical migration matrix, where the last row gives the
           default class.}
}

\value{
There is no return value if the given migration matrix \code{M} fullfills the
above attributes.
}

\references{ Glasserman, Paul, Monte Carlo Methods in Financial Engineering, Springer 2004 }

\author{Andreas Wittmann \email{andreas\_wittmann@gmx.de}}

\seealso{\code{\link{is.matrix}}}

\examples{
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

  cm.matrix(M)
}

\keyword{models}
