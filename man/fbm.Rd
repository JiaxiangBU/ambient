% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fractal-fbm.R
\name{fbm}
\alias{fbm}
\title{Fractional Brownian Motion fractal}
\usage{
fbm(base, new, strength, ...)
}
\arguments{
\item{base}{The prior values to modify}

\item{new}{The new values to modify \code{base} with}

\item{strength}{A value to modify \code{new} with before applying it to \code{base}}

\item{...}{ignored}
}
\description{
This is the archetypal fractal used when generating perlin noise. It works
simply by adding successive values together to create a final value. As the
succesive values are often calculated at increasing frequencies and the
strength is often decreasing, it will create the impression of ever-smaller
details as you zoom in. This function is intended to be used in conjunction
with \code{\link[=fracture]{fracture()}}
}
\examples{
grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000))

grid$simplex <- fracture(gen_simplex, fbm, octaves = 8, x = grid$x, y = grid$y)
plot(as.raster(grid, normalise(simplex)))

}
\seealso{
Other Fractal functions: \code{\link{billow}},
  \code{\link{clamped}}, \code{\link{ridged}}
}
\concept{Fractal functions}
