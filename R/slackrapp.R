#' @importFrom httr content GET
get_slackrapp <- function(team) {
  creds <- get_team_creds(team)

  if (length(creds) > 1) {
    message(sprintf("Only the first team (%s) will be used", team[1]))
  }

  URI <- file.path(.slack$api, creds[[1]]$memberid, creds[[1]]$key)

  .slack$creds <- httr::content(httr::GET(URI))
}
