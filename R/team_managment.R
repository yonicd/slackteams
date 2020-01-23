#' @title Team Managment Functions
#' @description Manage teams that can be accessed
#' @param team character, team name
#' @param verbose logical, Print messages to console, Default: TRUE
#' @param memberid chracter, member id of user in the team
#' @param key character, slackr-app key unique to the memberid
#' @return NULL
#' @concept managment
#' @rdname manage_team
#' @export
activate_team <- function(team, verbose = TRUE){

  validate_team(team)

  private_slack_get(team)
  slack_setenv()
  slack_team_info(team)
  .slack$current_team <- team
  if(verbose)
    slack_setenv_msg(team)

}


#' @rdname manage_team
#' @export
add_team <- function(team, memberid, key){
  new_team        <- list(memberid = memberid,key = key)
  names(new_team) <- team
  .slack$teams    <- append(.slack$teams,new_team)
}


#' @rdname manage_team
#' @export
remove_team <- function(team){

  idx <- which(team%in%get_teams())

  if(length(idx)>0)
    .slack$teams <- .slack$teams[-idx]
}
