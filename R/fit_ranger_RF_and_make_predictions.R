
#------------------------------------------------------------------------------

#' The function fits a random forest model using \code{\link{ranger}}.
#'
#' @title Fit a random forest model
#'
#' @param training_dataset a dataframe of the dataset used for model training.
#'
#' @param my_weights character string of the name of the column of \code{training dataset}
#'   with case weights.
#'
#' @inheritParams full_routine_bootstrap
#'
#' @inheritParams create_parameter_list
#'
#' @importFrom ranger ranger
#'
#' @return the random forest model object returned by \code{ranger}
#'
#' @export


fit_ranger_RF <- function(parms,
                          dependent_variable,
                          covariates_names,
                          training_dataset,
                          my_weights){

  num_threads <- parms$ranger_threads
  min_node_size <- parms$min_node_size
  no_trees <- parms$no_trees

  wgts <- training_dataset[, my_weights]

  train <- training_dataset[, c(dependent_variable, covariates_names)]

  ranger(formula = paste0(dependent_variable, "~ ."),
         data = train,
         num.trees = no_trees,
         importance = "impurity",
         case.weights = wgts,
         write.forest = TRUE,
         min.node.size = min_node_size,
         verbose = FALSE,
         num.threads = num_threads)

}


#------------------------------------------------------------------------------

#' The functions makes predictions using a \code{Ranger} model object and a dataset of covariates.
#'
#' @title Generate predictions from a \code{Ranger} model fit
#'
#' @param mod_obj the random forest model object returned by \code{ranger}.
#'
#' @param dataset the dataframe of the covariate dataset for which to make new predictions.
#'
#' @inheritParams full_routine_bootstrap
#'
#' @importFrom stats predict
#'
#' @export


make_ranger_predictions <- function(mod_obj, dataset, covariates_names){

  x_data <- subset(dataset, , covariates_names, drop = FALSE)

  preds <- predict(mod_obj, x_data)

  preds$predictions

}
