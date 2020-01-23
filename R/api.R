# Users

get_users_list <- function(..., token = Sys.getenv("SLACK_API_TOKEN")) {

  res <- call_slack(parse_call(),body = list(token = token,...))

  res <- paginate(res)

  tidy_slack(res)

}

# Conversations


get_conversations_list <- function(type = c('public_channel', 'private_channel','mpim','im'),
                                 ..., token = Sys.getenv("SLACK_API_TOKEN")) {

  types <- paste0(match.arg(type,several.ok = TRUE),collapse = ',')

  res <- call_slack(parse_call(),body = list(token = token, types = types,...))

  res <- paginate(res)

  tidy_slack(res)
}

get_conversations_info <- function(channel, ..., token = Sys.getenv("SLACK_API_TOKEN")) {

  res <- call_slack(parse_call(),body = list(channel = channel, token = token,...))

  res <- paginate(res)

  return(res)
}

get_conversations_members <- function(channel, ..., token = Sys.getenv("SLACK_API_TOKEN")) {

  info <- call_slack('conversations_info',body = list(channel = channel, token = token,include_num_members = TRUE))

  max_members <- info$channel$num_members

  res <- call_slack(parse_call(),body = list(channel = channel, token = token,...))

  res <- paginate(res)

  tidy_slack(res)

}

# Channels

get_channels_list <- function(..., token=Sys.getenv("SLACK_API_TOKEN")) {

  res <- call_slack(parse_call(),body = list(token = token,...))

  res <- paginate(res)

  tidy_slack(res)

}

get_channels_info <- function(channel, ..., token=Sys.getenv("SLACK_API_TOKEN")) {

  res <- call_slack(parse_call(),body = list(channel = channel, token = token,...))

  res <- paginate(res)

  res

}

# Groups

get_groups_list <- function(..., token=Sys.getenv("SLACK_API_TOKEN")) {

  res <- call_slack(parse_call(),body = list(token = token,...))

  res <- paginate(res)

  tidy_slack(res)

}

get_groups_info <- function(channel, ..., token=Sys.getenv("SLACK_API_TOKEN")) {

  res <- call_slack(parse_call(),body = list(channel = channel, token = token,...))

  res <- paginate(res)

  return(res)
}

