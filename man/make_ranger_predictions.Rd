% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fit_ranger_RF_and_make_predictions.R
\name{make_ranger_predictions}
\alias{make_ranger_predictions}
\title{Generate predictions from a \code{Ranger} model fit}
\usage{
make_ranger_predictions(mod_obj, dataset, covariates_names)
}
\arguments{
\item{mod_obj}{the random forest model object returned by \code{ranger}.}

\item{dataset}{the dataframe of the covariate dataset for which to make new predictions.}

\item{covariates_names}{character vector of covariates names.}
}
\description{
The functions makes predictions using a \code{Ranger} model object and a dataset of covariates.
}
