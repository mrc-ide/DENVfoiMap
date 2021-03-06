% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fit_ranger_RF_and_make_predictions.R
\name{fit_ranger_RF}
\alias{fit_ranger_RF}
\title{Fit a random forest model}
\usage{
fit_ranger_RF(parms, dependent_variable, covariates_names,
  training_dataset, my_weights)
}
\arguments{
\item{parms}{list of user-defined parameters.}

\item{dependent_variable}{character string of the fitted response variable (FOI).}

\item{covariates_names}{character vector of covariates names.}

\item{training_dataset}{a dataframe of the dataset used for model training.}

\item{my_weights}{character string of the name of the column of \code{training dataset}
with case weights.}
}
\value{
the random forest model object returned by \code{ranger}
}
\description{
The function fits a random forest model using \code{\link{ranger}}.
}
