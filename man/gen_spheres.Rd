% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pattern-spheres.R
\name{gen_spheres}
\alias{gen_spheres}
\title{Generate a pattern of concentric spheres}
\usage{
gen_spheres(x, y = NULL, z = NULL, t = NULL, frequency = 1)
}
\arguments{
\item{x, y, z, t}{The coordinates to get pattern from}

\item{frequency}{The frequency of the generator}
}
\value{
A numeric vector
}
\description{
This generator creates a pattern of concentric circles centered at 0.
Depending on how many dimensions you supply it can be used to generate
cylinders and circles as well. The output value is the shortest distance to
the nearest sphere normalised to be between -1 and 1. The frequency
determines the radius multiplier for each unit sphere.
}
\examples{
grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000))
grid$circles <- gen_spheres(grid$x, grid$y)
grid$cylinders <- gen_spheres(grid$x)

plot(as.raster(grid, normalise(circles)))
plot(as.raster(grid, normalise(cylinders)))

}
\seealso{
Other Pattern generators: \code{\link{gen_checkerboard}},
  \code{\link{gen_waves}}
}
\concept{Pattern generators}
