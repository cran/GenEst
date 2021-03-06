% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/app_utilities.R
\name{app_utilities}
\alias{app_utilities}
\alias{initialReactiveValues}
\alias{reVal}
\alias{setkNeed}
\alias{updateColNames_size}
\alias{selectData}
\alias{modNameSplit}
\alias{prepSizeclassText}
\alias{modNamePaste}
\alias{plotNA}
\alias{updateSizeclasses}
\alias{pickSizeclass}
\alias{updatesizeCol}
\title{app utilities}
\usage{
initialReactiveValues()

reVal(rv, toReVal)

setkNeed(rv)

updateColNames_size(rv)

selectData(data, cols)

modNameSplit(modNames, pos)

prepSizeclassText(sizeclasses)

modNamePaste(parts, type = "SE", tab = FALSE)

plotNA(type = "model")

updateSizeclasses(data, sizeCol)

pickSizeclass(sizeclasses, choice)

updatesizeCol(sizeCol, colNames_size)
}
\arguments{
\item{rv}{Reactive values list for the GenEst GUI, created by
\code{\link{initialReactiveValues}}, which calls
\code{\link[shiny]{reactiveValues}}}

\item{toReVal}{Names of elements in \code{rv} to reset to their factory
setting (as defined by \code{\link{initialReactiveValues}}).}

\item{data}{data table}

\item{cols}{column names to select}

\item{modNames}{names of the model to be split off}

\item{pos}{position in the name to split off}

\item{sizeclasses}{names of the carcass classes}

\item{parts}{the component parts of the model's name}

\item{type}{"SE" or "CP"}

\item{tab}{logical for if it's the table output for CP}

\item{sizeCol}{carcass class column name}

\item{choice}{carcass class chosen}

\item{colNames_size}{updated vector of size column names in all needed
tables}
}
\description{
utility functions for simple app rv management
}
