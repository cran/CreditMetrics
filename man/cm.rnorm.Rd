\name{cm.rnorm}
\alias{cm.rnorm}

\title{Computation of standard normal distributed random numbers}

\description{
\code{cm.rnorm} simulates standard normal distributed random numbers while using
antithetic sampling.
}

\usage{
cm.rnorm(N, n)
}

\arguments{
  \item{N}{number of simulations}
  \item{n}{number of simulated random numbers}
}

\details{
This function computes standard normal distributed random numbers with antithetic
sampling. Here one has a sequence of standard normal distributed random numbers
\eqn{(X_1,...,X_{n/2})}. Reflected random numbers are computed with
\deqn{X_i' = (-1) X_i}
So the sequence \eqn{X_1',...,X_{n/2}'} is also standard normal distributed
}

\value{
The function returns \code{N} simulations with \code{n} simulated random numbers
each.
}

\references{ Glasserman, Paul, Monte Carlo Methods in Financial Engineering, Springer 2004 }

\author{ Andreas Wittmann \email{andreas\_wittmann@gmx.de}}}

\seealso{\code{\link{matrix}}, \code{\link{rnorm}}}

\examples{
  N <- 3
  n <- 50000
  
  cm.rnorm(N, n)
}

\keyword{models}
