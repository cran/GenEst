% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/app_content.R
\name{app_content}
\alias{app_content}
\alias{createvtext}
\alias{gettingStartedContent}
\alias{aboutContent}
\alias{GenEstAuthors}
\alias{GenEstGUIauthors}
\alias{GenEstLicense}
\alias{GenEstAcknowledgements}
\alias{GenEstLogos}
\alias{disclaimersContent}
\alias{disclaimerUSGS}
\alias{disclaimerWEST}
\title{GenEst Information}
\usage{
createvtext(type = "Full")

gettingStartedContent()

aboutContent()

GenEstAuthors()

GenEstGUIauthors()

GenEstLicense()

GenEstAcknowledgements()

GenEstLogos()

disclaimersContent(appType = "base")

disclaimerUSGS()

disclaimerWEST(appType)
}
\arguments{
\item{type}{"Full" or "Short" or "Name" or "NameDate"}

\item{appType}{"base" (for local version) or "deploy" (for hosted version)}
}
\value{
Panels and text for displaying general information about GenEst
}
\description{
HTML generators for app information and content

\code{disclaimerUSGS} creates the text for the USGS
  disclaimer.
}
