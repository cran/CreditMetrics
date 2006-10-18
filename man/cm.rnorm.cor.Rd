\name{cm.rnorm.cor}
\alias{cm.rnorm.cor}

\title{Computation of correlated standard normal distributed random numbers}

\description{
\code{cm.rnorm.cor} computes correlated standard normal distributed random numbers.
This function uses a correlation matrix \code{rho} and later the cholesky
decompositon in order to get the correlated random numbers.
}

\usage{
cm.rnorm.cor(N, n, rho)
}

\arguments{
  \item{N}{number of simulations}
  \item{n}{number of simulated random numbers}
  \item{rho}{correlation matrix}
}

\details{
This function computes standard normal distributed random numbers which include
the correlation matrix \code{rho}. One has a random matrix \eqn{Y} which is
\eqn{N(0,1)} distributed. With the linear transformation \eqn{X = \mu + A Y}
one gets \eqn{X} is \eqn{N(\mu, A A^T)} distributed. If \eqn{X} should have
the correlation matrix \eqn{\Sigma}. By using the cholesky decomposition the
matrix \eqn{A} can be computed from \eqn{\Sigma}.
}

\value{
The function returns \code{N} simulations with \code{n} simulated random numbers
each which include the correlation matrix \code{rho}.
}

\references{ Glasserman, Paul, Monte Carlo Methods in Financial Engineering, Springer 2004 }

\author{ Andreas Wittmann \email{andreas\_wittmann@gmx.de}}}

\seealso{\code{\link{eigen}}, \code{\link{chol}}, \code{\link{cm.rnorm}}}

\examples{
  N <- 3
  n <- 50000
  firmnames <- c("firm 1", "firm 2", "firm 3")
  
  # correlation matrix
  rho <- matrix(c(  1, 0.4, 0.6,
                  0.4,   1, 0.5,
                  0.6, 0.5,   1), 3, 3, dimnames = list(firmnames, firmnames),
                  byrow = TRUE)
  
  cm.rnorm.cor(N, n, rho)
}

\keyword{models}
