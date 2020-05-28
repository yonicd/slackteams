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

#' @title Validate Channel Label
#' @description Validate that channel label exists in active team and
#'  convert it to the corresponding slack channel ID
#' @param channel character, channel label
#' @return character
#' @concept management
#' @rdname validate_channel
#' @export
validate_channel <- function(channel){

  # Strip leading # or @ to allow user flexibility.
  channel <- sub("^#", "", channel)
  channel <- sub("^@", "", channel)

  team_channels <- get_team_channels(
    get_active_team(),
    fields = c('id','name')
  )

  # Check both the id and name, in case the user passed in an id.
  if (channel %in% team_channels$id) {
    return(channel)
  } else if (channel %in% team_channels$name) {
    return(team_channels$id[grepl(sprintf('^%s$',channel), team_channels$name)])
  } else {
    stop("Unknown channel.")
  }

}
