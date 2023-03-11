# Users

#' @importFrom slackcalls post_slack
get_users_list <- function(..., token = Sys.getenv("SLACK_API_TOKEN"), max_results = Inf, max_calls = Inf) {

  res <- slackcalls::post_slack('users.list', max_results = max_results, max_calls = max_calls, token = token, ...)

  tidy_slack(res)
}

# Conversations

#' @title Get Channel List
#' @description Fetch channel information from the Slack API.
#' @param type character, the types of channels to include in the fetch.
#' @param ... additional parameters passed on to
#'   \code{\link[slackcalls]{post_slack}}
#' @param token character, api token issued by slack
#' @param max_results integer, the maximum number of results to return (total).
#' @param max_calls integer, the maximum number of separate API calls to make while constructing the response.
#' @return tibble
#' @concept get
#' @importFrom slackcalls post_slack
#' @export
get_conversations_list <- function(type = c("public_channel", "private_channel", "mpim", "im"), ..., token = Sys.getenv("SLACK_API_TOKEN"), max_results = Inf, max_calls = Inf) {
  types <- paste0(match.arg(type, several.ok = TRUE), collapse = ",")

  res <- slackcalls::post_slack('conversations.list', max_results = max_results, max_calls = max_calls, token = token, types = types, ...)

  tidy_slack(res)
}

#' @importFrom slackcalls post_slack
get_conversations_info <- function(channel, ..., token = Sys.getenv("SLACK_API_TOKEN"), max_results = Inf, max_calls = Inf) {

  res <- slackcalls::post_slack('conversations.info', max_results = max_results, max_calls = max_calls, channel = channel, token = token, ...)

  return(res)
}

#' @importFrom slackcalls post_slack
get_conversations_members <- function(channel, ..., token = Sys.getenv("SLACK_API_TOKEN"), max_results = Inf, max_calls = Inf) {
  res <- slackcalls::post_slack('conversations.members', max_results = max_results, max_calls = max_calls, channel = channel, token = token, ...)

  tidy_slack(res)
}

# Teams

#' @importFrom slackcalls post_slack
get_team_info <- function(team = NULL, ..., token = Sys.getenv("SLACK_API_TOKEN")) {
  res <- slackcalls::post_slack('team.info', team = team, token = token, ...)

  res
}
