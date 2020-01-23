clean_users = function(obj){
  obj[!obj$deleted,]
}

clean_channel <- function(obj, team){

  users <- .slack$users[[team]]

  cols <- c('id','name','user','num_members','is_channel','is_im','is_private','is_mpim','is_group')
  channels <- obj[!obj$is_archived,intersect(cols,names(obj))]
  channels$name[channels$is_im] <- users$name[match(channels$user[channels$is_im],users$id)]
  channels$is_channel[channels$is_im] <- FALSE
  channels$is_private[channels$is_im] <- FALSE
  channels$is_mpim[channels$is_im] <- FALSE
  channels$is_group[channels$is_im] <- FALSE

  channels
}

private_slack_get <- function(team){

  creds <- get_team_creds(team)

  if(length(creds)>1)
    message(sprintf('Only the first team (%s) will be used',team[1]))

  URI <- file.path(.slack$api,creds[[1]]$memberid,creds[[1]]$key)

  .slack$creds <- httr::content(httr::GET(URI))

}

slack_setenv_msg <- function(team){
  tmpl <- "slackr environment variables are set to '%s' supplied definitions"
  message(sprintf(tmpl, team))
}

slack_setenv <- function(){
  Sys.setenv(SLACK_CHANNEL             = .slack$creds$channel)
  Sys.setenv(SLACK_USERNAME            = .slack$username)
  Sys.setenv(SLACK_ICON_EMOJI          = .slack$icon_emoji)
  Sys.setenv(SLACK_INCOMING_URL_PREFIX = .slack$creds$incoming_webhook_url)
  Sys.setenv(SLACK_API_TOKEN           = .slack$creds$api_token)
}

slack_team_info <- function(team){
  .slack$users[[team]] <- clean_users(get_users_list())
  .slack$channels[[team]] <- clean_channel(get_conversations_list(),team)
}

update_cache <- function(){
  .slack$slack_team_info(get_active_team())
}

validate_team <- function(team){

  if(!length(.slack$teams))
    stop('teams are not loaded use load_teams()')

  teams <- get_teams()
  teams_str <- paste0(sprintf("'%s'",teams),collapse = ', ')

  if(!team%in%teams){
    err_msg <- sprintf("team '%s' not in loaded teams\nchoose one of: %s",team,teams_str)
    stop(err_msg)
  }


  return(TRUE)

}
