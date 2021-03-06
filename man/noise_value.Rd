% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/noise-value.R
\name{noise_value}
\alias{noise_value}
\alias{gen_value}
\title{Value noise generator}
\usage{
noise_value(dim, frequency = 0.01, interpolator = "quintic",
  fractal = "fbm", octaves = 3, lacunarity = 2, gain = 0.5,
  pertubation = "none", pertubation_amplitude = 1)

gen_value(x, y = NULL, z = NULL, frequency = 1, seed = NULL,
  interpolator = "quintic")
}
\arguments{
\item{dim}{The dimensions (height, width, (and depth)) of the noise to be
generated. The length determines the dimensionality of the noise.}

\item{frequency}{Determines the granularity of the features in the noise.}

\item{interpolator}{How should values between sampled points be calculated?
Either \code{'linear'}, \code{'hermite'}, or \code{'quintic'} (default), ranging from lowest
to highest quality.}

\item{fractal}{The fractal type to use. Either \code{'none'}, \code{'fbm'} (default),
\code{'billow'}, or \code{'rigid-multi'}. It is suggested that you experiment with the
different types to get a feel for how they behaves.}

\item{octaves}{The number of noise layers used to create the fractal noise.
Ignored if \code{fractal = 'none'}. Defaults to \code{3}.}

\item{lacunarity}{The frequency multiplier between successive noise layers
when building fractal noise. Ignored if \code{fractal = 'none'}. Defaults to \code{2}.}

\item{gain}{The relative strength between successive noise layers when
building fractal noise. Ignored if \code{fractal = 'none'}. Defaults to \code{0.5}.}

\item{pertubation}{The pertubation to use. Either \code{'none'} (default),
\code{'normal'}, or \code{'fractal'}. Defines the displacement (warping) of the noise,
with \code{'normal'} giving a smooth warping and \code{'fractal'} giving a more eratic
warping.}

\item{pertubation_amplitude}{The maximal pertubation distance from the
origin. Ignored if \code{pertubation = 'none'}. Defaults to \code{1}.}

\item{x, y, z}{Coordinates to get noise value from}

\item{seed}{The seed to use for the noise. If \code{NULL} a random seed will be
used}
}
\value{
For \code{noise_value()} a matrix if \code{length(dim) == 2} or an array if
\code{length(dim) == 3}. For \code{gen_value()} a numeric vector matching the length of
the input.
}
\description{
Value noise is a simpler version of cubic noise that uses linear
interpolation between neighboring grid points. This creates a more distinct
smooth checkerboard pattern than cubic noise, where interpolation takes all
the surrounding grid points into accout.
}
\examples{
# Basic use
noise <- noise_value(c(100, 100))

plot(as.raster(normalise(noise)))

# Using the generator
grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000))
grid$noise <- gen_value(grid$x, grid$y)
plot(as.raster(grid, normalise(noise)))

}
