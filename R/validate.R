validate_team <- function(team) {
  if (!length(.slack$teams)) {
    stop("teams are not loaded use load_teams()")
  }

  teams <- get_teams()
  teams_str <- paste0(sprintf("'%s'", teams), collapse = ", ")

  if (!team %in% teams) {
    err_msg <- sprintf("team '%s' not in loaded teams\nchoose one of: %s", team, teams_str)
    stop(err_msg)
  }


  return(TRUE)
}

#' @importFrom httr warn_for_status content
validate_response <- function(res) {
  httr::warn_for_status(res)

  res_content <- httr::content(res)

  if (!res_content$ok) {
    return(res_content$error)
  }

  res_content
}
