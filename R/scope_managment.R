yml2scopes <- function(y) {
  idx <- which(sapply(y[[1]], inherits, what = "list"))

  if (length(idx) > 0) {
    y[[1]][[idx]] <- yml2scopes(y[[1]][[idx]])
  }

  if (is.null(names(y))) {
    y[[1]]
  } else {
    paste(names(y), y[[1]], sep = ":")
  }
}

#' @title Scope Management
#' @description Determine scopes from a file.
#' @param file character; a path to a yaml file with scopes defined.
#' @param which character; the group of scopes to use within that yaml.
#' @return A character vector of scopes.
#' @export
load_scopes <- function(file = system.file("scopes.yml", package = "slackteams"),
                   which = "slackverse") {
  yml <- yaml::read_yaml(file)
  ret <- lapply(yml, function(x) unlist(lapply(x, yml2scopes)))
  ret[[which]]
}
