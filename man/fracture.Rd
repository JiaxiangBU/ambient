% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fracture.R
\name{fracture}
\alias{fracture}
\title{Create fractals of a noise or pattern}
\usage{
fracture(noise, fractal, octaves, gain = ~./2, frequency = ~. * 2,
  seed = NULL, ..., fractal_args = list())
}
\arguments{
\item{noise}{The noise function to create a fractal from. Must have a
\code{frequency} argument.}

\item{fractal}{The fractal function to combine the generated values with. Can
be one of the provided ones or a self-made function. If created by hand it
must have the following arguments:
\itemize{
\item \code{base}: The current noise values
\item \code{new}: The new noise values to combine with \code{base}
\item \code{strength}: The value from \code{gain} corresponding to the index of \code{new}
\item \code{octave}: The index of \code{new}
}

And must return a numeric vector of the same length as \code{new}}

\item{octaves}{The number of generated values to combine}

\item{gain}{The intensity of the generated values at each octave. The
interpretation of this is up to the fractal function. Usually the intensity
will gradually fall as the frequency increases. Can either be a vector of
values or a (lambda) function that returns a new value based on the prior,
e.g. \code{~ . / 2}. The default is often a good starting point though e.g.
\code{\link[=ridged]{ridged()}} fractal has been designed with a special gain function.}

\item{frequency}{The frequency to use at each octave. Can either be a vector
of values or a function that returns a new value based on the prior. See
\code{gain}.}

\item{seed}{A seed for the noise generator. Will be expanded to the number of
octaves so each gets a unique seed.}

\item{...}{arguments to pass on to \code{generator}}

\item{fractal_args}{Additional arguments to \code{fractal} as a named list}
}
\description{
This function allows you to create fractals of a given noise or pattern
generator by calculating it repeatedly at changing frequency and combining
the results based on a fractal function.
}
\examples{
grid <- long_grid(seq(1, 10, length.out = 1000), seq(1, 10, length.out = 1000))

# When noise is generated by it's own it doesn't have fractal properties
grid$clean_perlin <- gen_perlin(grid$x, grid$y)
plot(as.raster(grid, normalise(clean_perlin)))

# Use fracture to apply a fractal algorithm to the noise
grid$fractal_perlin <- fracture(gen_perlin, fbm, octaves = 8,
                                x = grid$x, y = grid$y)
plot(as.raster(grid, normalise(fractal_perlin)))

}
\seealso{
ambient comes with a range of build in fractal functions: \code{\link[=fbm]{fbm()}},
\code{\link[=billow]{billow()}}, \code{\link[=ridged]{ridged()}}, \code{\link[=clamped]{clamped()}}
}
