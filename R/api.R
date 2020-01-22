# Users

get_users_list <- function(...,api_token=Sys.getenv("SLACK_API_TOKEN")) {

  res <- call_slack(parse_call(),body = list(token = api_token,...))

  tidy_slack(res)

}

# Conversations


get_conversations_list <- function(type = c('public_channel', 'private_channel','mpim','im'),
                                 ...,
                                 api_token=Sys.getenv("SLACK_API_TOKEN")) {

  types <- paste0(match.arg(type,several.ok = TRUE),collapse = ',')

  res <- call_slack(parse_call(),body = list(token = api_token, types = types,...))

  tidy_slack(res)
}

get_conversations_info <- function(channel,...,api_token=Sys.getenv("SLACK_API_TOKEN")) {

  res <- call_slack(parse_call(),body = list(channel = channel, token = api_token,...))

  return(res)
}

get_conversations_members <- function(channel,...,api_token=Sys.getenv("SLACK_API_TOKEN")) {

  res <- call_slack(parse_call(),body = list(channel = channel, token = api_token,...))

  return(res)
}

# Channels

get_channels_list <- function(...,api_token=Sys.getenv("SLACK_API_TOKEN")) {

  res <- call_slack(parse_call(),body = list(token = api_token,...))

  tidy_slack(res)

}

get_channels_info <- function(channel,...,api_token=Sys.getenv("SLACK_API_TOKEN")) {

  res <- call_slack(parse_call(),body = list(channel = channel, token = api_token,...))

}

# Groups

get_groups_list <- function(...,api_token=Sys.getenv("SLACK_API_TOKEN")) {

  res <- call_slack(parse_call(),body = list(token = api_token,...))

  tidy_slack(res)

}

get_groups_info <- function(channel,...,api_token=Sys.getenv("SLACK_API_TOKEN")) {

  res <- call_slack(parse_call(),body = list(channel = channel, token = api_token,...))

  return(res)
}

