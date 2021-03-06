% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MakeStand.R
\name{make_standprop}
\alias{make_standprop}
\title{Create daily plant characteristics from parameters and options}
\usage{
make_standprop(options.b90, param.b90, out.years)
}
\arguments{
\item{options.b90}{a list of model control options}

\item{param.b90}{a parameter list-object}

\item{out.years}{years for which values are returned.}
}
\value{
a data.frame containing daily sequences of 'age', 'height', 'sai', 'densef', and 'lai'.
}
\description{
Creates daily sequences of 'age', 'height', 'sai', 'densef', and 'lai' from parameter and options
using \code{\link{approx_standprop}} and \code{\link{MakeSeasLAI}}.
}
\examples{
options.b90 <- setoptions_LWFB90()
param.b90 <- setparam_LWFB90()

standprop <- make_standprop(options.b90,
                            param.b90,
                            out.years = 2002:2004)
plot(standprop$dates, standprop$lai, type = "l")
}
