
get_users <- function(api_token=Sys.getenv("SLACK_API_TOKEN")) {

  loc <- Sys.getlocale('LC_CTYPE')
  Sys.setlocale('LC_CTYPE','C')
  on.exit(Sys.setlocale("LC_CTYPE", loc))

  tmp <- httr::POST("https://slack.com/api/users.list", body=list(token=api_token))
  httr::stop_for_status(tmp)
  members <- jsonlite::fromJSON(httr::content(tmp, as="text"))$members
  cols <- setdiff(colnames(members), c("profile", "real_name"))
  cbind.data.frame(members[,cols], members$profile, stringsAsFactors=FALSE)

}

get_conversations <- function(type = c('public_channel', 'private_channel','mpim','im'),
                                 ...,
                                 api_token=Sys.getenv("SLACK_API_TOKEN")) {

  loc <- Sys.getlocale('LC_CTYPE')
  Sys.setlocale('LC_CTYPE','C')
  on.exit(Sys.setlocale("LC_CTYPE", loc))

  types <- paste0(match.arg(type,several.ok = TRUE),collapse = ',')

  URI <- "https://slack.com/api/conversations.list"

  res <- httr::POST(
    url = URI,
    body = build_body(list(token=api_token,types = types),...)
  )

  res_validate(res)

}

get_conversations_info <- function(channel,api_token=Sys.getenv("SLACK_API_TOKEN")) {

  loc <- Sys.getlocale('LC_CTYPE')
  Sys.setlocale('LC_CTYPE','C')
  on.exit(Sys.setlocale("LC_CTYPE", loc))

  tmp <- httr::POST("https://slack.com/api/conversations.info",
                    body=list(
                      channel = channel,
                      token=api_token
                      ))

  httr::stop_for_status(tmp)
  httr::content(tmp)

}

get_channels <- function(api_token=Sys.getenv("SLACK_API_TOKEN")) {

  loc <- Sys.getlocale('LC_CTYPE')
  Sys.setlocale('LC_CTYPE','C')
  on.exit(Sys.setlocale("LC_CTYPE", loc))

  tmp <- httr::POST("https://slack.com/api/channels.list",
              body=list(token=api_token))

  httr::stop_for_status(tmp)
  jsonlite::fromJSON(httr::content(tmp, as="text"))$channels

}

get_channels_info <- function(channel,api_token=Sys.getenv("SLACK_API_TOKEN")) {

  loc <- Sys.getlocale('LC_CTYPE')
  Sys.setlocale('LC_CTYPE','C')
  on.exit(Sys.setlocale("LC_CTYPE", loc))

  tmp <- httr::POST("https://slack.com/api/channels.info",
                    body=list(
                      channel = channel,
                      token=api_token
                      ))

  httr::stop_for_status(tmp)
  httr::content(tmp)

}

get_groups <- function(api_token=Sys.getenv("SLACK_API_TOKEN")) {

  loc <- Sys.getlocale('LC_CTYPE')
  Sys.setlocale('LC_CTYPE','C')
  on.exit(Sys.setlocale("LC_CTYPE", loc))

  tmp <- httr::POST("https://slack.com/api/groups.list", body=list(token=api_token))
  httr::stop_for_status(tmp)
  jsonlite::fromJSON(httr::content(tmp, as="text"))$groups

}

get_groups_info <- function(channel,api_token=Sys.getenv("SLACK_API_TOKEN")) {

  loc <- Sys.getlocale('LC_CTYPE')
  Sys.setlocale('LC_CTYPE','C')
  on.exit(Sys.setlocale("LC_CTYPE", loc))

  tmp <- httr::POST("https://slack.com/api/groups.info",
                    body=list(
                      channel = channel,
                      token=api_token
                    ))

  httr::stop_for_status(tmp)
  httr::content(tmp)

}

build_body <- function(parts,...){
  append(parts,list(...))
}

res_validate <- function(res){

  httr::warn_for_status(res)

  res_content <- jsonlite::fromJSON(httr::content(res,as = 'text'))

  if(!res_content$ok){
    return(res_content$error)
  }

  res_content
}

map_channel <- function(channel,type){

    channels <- get_channels()
    channel_type <- channels[[sprintf('is_%s',gsub('s$','',type))]]

    channels$id[channels$name==channel&channel_type]

}

