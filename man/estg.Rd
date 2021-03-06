% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/detection_probability_functions.R
\name{estg}
\alias{estg}
\title{Estimate all carcass-level detection rates and arrival intervals}
\usage{
estg(
  data_CO,
  COdate,
  data_SS,
  SSdate = NULL,
  model_SE,
  model_CP,
  model_DWP = NULL,
  sizeCol = NULL,
  unitCol = NULL,
  IDcol = NULL,
  nsim = 1000,
  max_intervals = 8
)
}
\arguments{
\item{data_CO}{Carcass Observation data}

\item{COdate}{Column name for the date found data}

\item{data_SS}{Search Schedule data}

\item{SSdate}{Column name for the date searched data. Optional.
If not provided, \code{estg} will try to find the SSdate among
the columns in data_SS. See \code{\link{prepSS}}.}

\item{model_SE}{Searcher Efficiency model (or list of models if there are
multiple carcass classes)}

\item{model_CP}{Carcass Persistence model (or list of models if there are
multiple carcass classes)}

\item{model_DWP}{Density weighted proportion model (or list of models if
there are multiple carcass classes)}

\item{sizeCol}{Name of column in \code{data_CO} where the carcass classes
are recorded. Optional. If not provided, no distinctions are made among
sizes. \code{sizeCol} not only identifies what the name of the size
segregating class}

\item{unitCol}{Column name for the unit indicator}

\item{IDcol}{Column name for unique carcass IDs (required)}

\item{nsim}{the number of simulation draws}

\item{max_intervals}{maximum number of arrival interval intervals to 
consider for each carcass. Optional. Limiting the number of search 
intervals can greatly increase the speed of calculations with only a 
slight reduction in accuracy in most cases.}
}
\value{
list of [1] g estimates (\code{ghat}) and [2] arrival interval
 estimates (\code{Aj}) for each of the carcasses. The row names of the
 \code{Aj} matrix are the units at which carcasses were found. Row names of
 \code{ghat} are the carcass IDs (in \code{data_CO}).
}
\description{
Estimate g values and arrival intervals for a set of carcasses
  from fitted pk and cp models and search data
}
\examples{
 data(mock)
 model_SE <- pkm(formula_p = p ~ HabitatType, formula_k = k ~ 1,
              data = mock$SE)
 model_CP <- cpm(formula_l = l ~ Visibility, formula_s = s ~ Visibility, 
               data = mock$CP, dist = "weibull",
               left = "LastPresentDecimalDays", 
               right = "FirstAbsentDecimalDays"
             )
 ghat <- estg(data_CO = mock$CO, COdate = "DateFound",  data_SS = mock$SS,
      model_SE = model_SE, model_CP = model_CP, unitCol = "Unit", nsim = 100)

}
