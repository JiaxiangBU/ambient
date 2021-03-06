% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/noise-perlin.R
\name{noise_perlin}
\alias{noise_perlin}
\alias{gen_perlin}
\title{Perlin noise generator}
\usage{
noise_perlin(dim, frequency = 0.01, interpolator = "quintic",
  fractal = "fbm", octaves = 3, lacunarity = 2, gain = 0.5,
  pertubation = "none", pertubation_amplitude = 1)

gen_perlin(x, y = NULL, z = NULL, frequency = 1, seed = NULL,
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
For \code{noise_perlin()} a matrix if \code{length(dim) == 2} or an array if
\code{length(dim) == 3}. For \code{gen_perlin()} a numeric vector matching the length of
the input.
}
\description{
This function generates either 2 or 3 dimensional perlin noise, with optional
pertubation and fractality. Perlin noise is one of the most well known
gradient noise algorithms and have been used extensively as the basis for
generating landscapes and textures, as well as within generative art.
The algorithm was developed by Ken Perlin in 1983.
}
\examples{
# Basic use
noise <- noise_perlin(c(100, 100))

plot(as.raster(normalise(noise)))

# Using the generator
grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000))
grid$noise <- gen_perlin(grid$x, grid$y)
plot(as.raster(grid, normalise(noise)))

}
\references{
Perlin, Ken (1985). \emph{An Image Synthesizer}. SIGGRAPH Comput. Graph. 19
(0097-8930): 287–296. doi:10.1145/325165.325247.
}
