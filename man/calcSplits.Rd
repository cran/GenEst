% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/splits_functions.R
\name{calcSplits}
\alias{calcSplits}
\title{Estimate the number of fatalities by up to two splitting covariates}
\usage{
calcSplits(
  M,
  split_CO = NULL,
  data_CO = NULL,
  split_SS = NULL,
  data_SS = NULL,
  split_time = NULL,
  ...
)
}
\arguments{
\item{M}{\code{\link{estM}} object, containing numeric array (ncarc x nsim)
of estimated mortalities and other pieces}

\item{split_CO}{Character vector of names of splitting covariates to be
found in the \code{data_CO} data frame. No more than two \code{split_CO} 
variables are allowed. Use \code{split_CO = NULL} if no CO splits are 
desired.}

\item{data_CO}{data frame that summarizes the carcass search data and must
include columns specified by the \code{split_CO} arg. Each row includes
search and discovery parameters associated with a single observed 
carcass. Columns include carcass ID, carcass discovery date, unit, and 
any number of covariates. \code{data_CO} is required if and only if 
\code{split_CO} is non-NULL.}

\item{split_SS}{Character string giving the name of a splitting covariate 
in the \code{data_SS} list, with \code{data_SS[[split_SS]]} describing
characteristics of the search intervals (e.g., "season"). Note that
\code{length(data_SS[[split_SS]]} must equal 
\code{length(data_SS$days) - 1} because no inference is made about
carcass arrivals prior to time t = 0, and the "interval" prior to t = 0 
is not taken as a "search interval." If no \code{split_SS} split is 
desired, use \code{split_SS = NULL}.}

\item{data_SS}{Search schedule data}

\item{split_time}{Numeric vector that defines time intervals for splits.
Times must be numeric, strictly increasing, and span the monitoring period
[0, \code{max(data_SS$days)}]. If no \code{split_time} is desired, use
\code{split_time = NULL}. If \code{split_time} is NULL and \code{split_SS}
is not NULL, \code{data_SS} is required.}

\item{...}{arguments to be passed down}
}
\value{
An object of class \code{splitFull} is returned. If one splitting
 covariate is given, then the output will be an array of estimated
 mortality in each level of the splitting covariate, with one row for each
 covariate level and one column for each simulation draw. If two splitting
 covariates are given, output will be a list of arrays. Each array gives
 the estimated mortalities for one level of the second splitting covariate
 and all levels of the first splitting covariate.

 Objects of class \code{splitFull} have attributes \code{vars} (which gives
 the name of the splitting covariate(s)) and \code{type} (which specifies
 whether the covariate(s) are of type \code{split_CO}, \code{split_SS}, or
 \code{split_time}). A summary of a resulting \code{splitFull} object
 is returned from the S3 function \code{summary(splits, CL = 0.90, ...)},
 which gives the mean and a 5-number summary for each level of each
 covariate. The 5-number summary includes the alpha/2, 0.25, 0.5, 0.75,
 and 1 - alpha/2 quantiles, where alpha = 1 - CL. A graph summarizing the
 results can be drawn using \code{plot(splits, CL, ...)}, which gives
 a graphical representation of the \code{summary}.
}
\description{
Total mortality can be split into sub-categories, according to
  various splitting covariates such as species, visibility class, season, 
  site, unit, etc. Given the carcass search data, estimated mortalities, 
  and splitting covariates, \code{calcSplits()} gives the "splits" or 
  summaries the estimated mortalities by levels of the splitting 
  covariates. For example, user may specify \code{"season"} and 
  \code{"species"} as splitting variables to see estimated mortalities by
  season and species. Input would be arrays of estimated mortalities and
  arrival intervals when \code{ncarc} carcass have been discovered and 
  uncertainty in mortality estimates is captured via simulation with 
  \code{nsim} simulation draws.
}
\details{
Arrival intervals (\code{Aj}) are given as integers, j, that
 indicate which search interval the given carcass (indexed by row) arrived
 in the given simulation draw (indexed by column). Arrival interval indices
 (j) are relative to indexed carcasses' search schedules.

 No more than two splitting variables (\code{split_CO}, \code{split_SS}, 
 and \code{split_time}) in total may be used. \code{split_CO} variables
 describe qualitative characteristics of the observed carcasses or where
 they were found. Some examples include searcher (DHD, JPS, MMH), carcass
 size (S, M, L), species, age (fresh/dry or immature/mature), unit,
 visibility class (easy, moderate, difficult), etc.

\code{split_SS} variables describe characteristics of the search intervals,
  such as season (spring, summer, fall, winter) or treatment
  (pre- or post-minimization). Each search interval is assigned a level of 
  the \code{split_SS} variable. For example, for a search schedule with
  5 searches (including a search at t = 0), and the \code{split_SS} 
  variable would have values for each of the 4 search intervals. The
  levels of the \code{split_SS} must be in contiguous blocks. For example,
  \code{season = c("S", "S", "F", "F")} would be acceptable, but
  \code{season = c("S", "F", "S", "F")} would not be.

\code{split_time} variables are numeric vectors that split the monitoring
  period into distinct time intervals. For example,
  \code{split_time = c(0, 30, 60, 90, 120)} would split the 120 monitoring
  period into 30-day intervals, and \code{calcSplits()} would return 
  mortality estimates for each of the intervals.
}
\examples{
 \donttest{
  model_SE <- pkm(p ~ 1, k ~ 1, data = wind_RPbat$SE)
  model_CP <- cpm(l ~ 1, s ~ 1, data = wind_RPbat$CP, dist = "weibull",
    left = "LastPresent", right = "FirstAbsent")
  Mhat <- estM(nsim = 1000, data_CO = wind_RPbat$CO, 
    data_SS = wind_RPbat$SS, data_DWP = wind_RPbat$DWP, 
    model_SE = model_SE, model_CP = model_CP,
    unitCol = "Turbine", COdate = "DateFound")

  M_spp <- calcSplits(M = Mhat, split_CO = "Species",
    data_CO = wind_RPbat$CO)
  summary(M_spp)
  plot(M_spp)
 }
}
