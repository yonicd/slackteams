#' @title Team Managment Functions
#' @description Manage teams that can be accessed
#' @param team character, team name
#' @param verbose logical, Print messages to console, Default: TRUE
#' @param memberid chracter, member id of user in the team
#' @param key character, slackr-app key unique to the memberid
#' @details If the team credentials are last loaded via load_teams() then
#'  when activating a team slackrapp will be called to retrieve
#'  private webhook information needed to interact with Slack API.
#'  If the team credentials are last loaded via load_team_dcf() the
#'  private webhook is assumed to be located in the file.
#' @return NULL
#' @concept managment
#' @rdname manage_team
#' @importFrom jsonlite validate
#' @export
activate_team <- function(team, verbose = TRUE) {
  validate_team(team)

  if(jsonlite::validate(txt = readLines(.slack$file[[team]]))){
    get_slackrapp(team)
  }

  slack_setenv()
  slack_team_info(team)
  .slack$current_team <- team
  if (verbose) {
    slack_setenv_msg(team)
  }
}


#' @rdname manage_team
#' @export
add_team <- function(team, memberid, key) {
  new_team <- list(memberid = memberid, key = key)
  names(new_team) <- team
  .slack$teams <- append(.slack$teams, new_team)
}


#' @rdname manage_team
#' @export
remove_team <- function(team) {
  idx <- which(team %in% get_teams())

  if (length(idx) > 0) {
    .slack$teams <- .slack$teams[-idx]
  }
}

slack_team_info <- function(team) {
  # activeteam <- get_team_info()
  # .slack$activeteam <- activeteam[['team']][['id']]
  .slack$users[[team]] <- clean_users(get_users_list())
  .slack$channels[[team]] <- clean_channel(get_conversations_list(), team)
}

update_cache <- function() {
  slack_team_info(get_active_team())
}
