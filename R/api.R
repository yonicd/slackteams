# Users

#' @importFrom slackcalls post_slack
get_users_list <- function(..., token = Sys.getenv("SLACK_API_TOKEN"), max_results = Inf, max_calls = Inf) {

  res <- slackcalls::post_slack(parse_call(), max_results = max_results, max_calls = max_calls, token = token, ...)

  tidy_slack(res)
}

# Conversations

#' @importFrom slackcalls post_slack
get_conversations_list <- function(type = c("public_channel", "private_channel", "mpim", "im"), ..., token = Sys.getenv("SLACK_API_TOKEN"), max_results = Inf, max_calls = Inf) {
  types <- paste0(match.arg(type, several.ok = TRUE), collapse = ",")

  res <- slackcalls::post_slack(parse_call(), max_results = max_results, max_calls = max_calls, token = token, types = types, ...)

  tidy_slack(res)
}

#' @importFrom slackcalls post_slack
get_conversations_info <- function(channel, ..., token = Sys.getenv("SLACK_API_TOKEN"), max_results = Inf, max_calls = Inf) {

  res <- slackcalls::post_slack(parse_call(), max_results = max_results, max_calls = max_calls, channel = channel, token = token, ...)

  return(res)
}

#' @importFrom slackcalls post_slack
get_conversations_members <- function(channel, ..., token = Sys.getenv("SLACK_API_TOKEN"), max_results = Inf, max_calls = Inf) {
  res <- slackcalls::post_slack(parse_call(), max_results = max_results, max_calls = max_calls, channel = channel, token = token, ...)

  tidy_slack(res)
}

# Channels

#' @importFrom slackcalls post_slack
get_channels_list <- function(..., token = Sys.getenv("SLACK_API_TOKEN"), max_results = Inf, max_calls = Inf) {
  res <- slackcalls::post_slack(parse_call(), max_results = max_results, max_calls = max_calls, token = token, ...)

  tidy_slack(res)
}

#' @importFrom slackcalls post_slack
get_channels_info <- function(channel, ..., token = Sys.getenv("SLACK_API_TOKEN"), max_results = Inf, max_calls = Inf) {
  res <- slackcalls::post_slack(parse_call(), max_results = max_results, max_calls = max_calls, channel = channel, token = token, ...)

  res
}

# Groups

#' @importFrom slackcalls post_slack
get_groups_list <- function(..., token = Sys.getenv("SLACK_API_TOKEN"), max_results = Inf, max_calls = Inf) {
  res <- slackcalls::post_slack(parse_call(), max_results = max_results, max_calls = max_calls, token = token, ...)

  tidy_slack(res)
}

#' @importFrom slackcalls post_slack
get_groups_info <- function(channel, ..., token = Sys.getenv("SLACK_API_TOKEN"), max_results = Inf, max_calls = Inf) {
  res <- slackcalls::post_slack(parse_call(), max_results = max_results, max_calls = max_calls, channel = channel, token = token, ...)

  return(res)
}
