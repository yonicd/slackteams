#' @title Set Team Information
#' @description Set global team environment variables that are
#'  passed to slack in the api calls.
#' @param username character, user name, Default: 'slackr'
#' @param icon_emoji character, icon emoji, Default: ''
#' @param setenv logical, Set the value to the environment variable, Default: TRUE
#' @return NULL
#' @concept set
#' @rdname set_team_envvars
#' @export
set_username <- function(username = "slackr", setenv = TRUE) {
  assign("username", username, envir = .slack)
  if (setenv) {
    Sys.setenv(SLACK_USERNAME = .slack$username)
  }
}


#' @rdname set_team_envvars
#' @export
set_icon_emoji <- function(icon_emoji = "", setenv = TRUE) {
  assign("icon_emoji", icon_emoji, envir = .slack)
  if (setenv) {
    Sys.setenv(SLACK_ICON_EMOJI = .slack$icon_emoji)
  }
}
