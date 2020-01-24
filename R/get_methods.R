#' @title Query Team Information
#' @description Functions to extract information about teams
#' @param team character, name of team
#' @param fields character, columns to return in get_team_channels and get_team_users, NULL will return all the columns
#' @param id character, unique member id
#' @param channel character, name of a channel
#' @return character
#' @details
#'  Channels can be a public channel, a private channel a direct message or group direct message. To get the names of the channels
#'  the user has access to use [get_team_channels(fields = 'name')][slackteams::get_team_channels].
#' @concept get
#' @rdname get_methods
#' @export
get_teams <- function() {
  names(.slack$teams)
}

#' @rdname get_methods
#' @export
get_team_env <- function() {
  sapply(
    sprintf("SLACK_%s", toupper(.slack$env_fields)), Sys.getenv
  )
}

#' @rdname get_methods
#' @export
get_active_team <- function() {
  team <- .slack$current_team

  if (is.null(team)) {
    stop("No active team, to activate a team use activate_team()")
  }

  team
}

#' @rdname get_methods
#' @export
get_team_creds <- function(team) {
  idx <- which(team %in% get_teams())

  if (length(idx) != length(team)) {
    if (!length(idx)) {
      miss_team <- paste0(team[seq_along(team)], collapse = ", ")
    } else {
      miss_team <- paste0(team[-idx], collapse = ", ")
    }
    msg_names <- "Use the get_teams() to return the stored team names"
    msg <- sprintf("Team '%s' not found\n%s", miss_team, msg_names)
    return(message(msg))

    team <- team[idx]
  }

  .slack$teams[team]
}

#' @rdname get_methods
#' @export
get_team_users <- function(team, fields = c("id", "name", "real_name")) {
  if (missing(team)) {
    team <- get_active_team()
  }

  users <- .slack$users[[team]]

  if (!is.null(fields)) {
    users <- users[, fields]
  }

  users
}

#' @rdname get_methods
#' @export
get_team_channels <- function(team, fields = NULL) {
  if (missing(team)) {
    team <- get_active_team()
  }

  chnls <- .slack$channels[[team]]

  if (!is.null(fields)) {
    chnls <- chnls[, fields]
  }

  chnls
}

#' @rdname get_methods
#' @export
get_channel_members <- function(channel) {
  res <- get_channel_info(channel)

  if(is.null(res$members)){
    ret <- res$user
  }else{
    ret <- unlist(res$members)
  }

  get_member_name(ret)

}

#' @rdname get_methods
#' @export
get_channel_info <- function(channel) {
  team_channels <- get_team_channels(fields = c("id", "name"))

  id <- team_channels$id[team_channels$name == channel]

  if (!length(id)) {
    stop(sprintf("Channel '%s' not found",channel))
  }

  switch(substr(id, 1, 1),
    C = {
      get_channels_info(id)$channel
    },
    G = {
      get_groups_info(id)$group
    },
    D = {
      get_conversations_info(id)$channel
    }
  )
}

#' @rdname get_methods
#' @export
get_member_name <- function(id) {
  res <- get_team_users(
    team = get_active_team(),
    fields = c("id", "name")
    )

  res[res$id %in% id,]
}
