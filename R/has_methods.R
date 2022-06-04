#' @title Active Team Predicate
#' @description Function to check whether team values exist.
#' @return logical
#' @rdname has_methods
#' @concept management
#' @export
has_active_team <- function() {
  team <- .slack$activeteam

  !is.null(team) && !is.na(team)
}
