#' @title Query Team Information
#' @description Functions to extract information about teams
#' @param team character, name of team
#' @param fields character, columns to return in get_team_channels and get_team_users, NULL will return all the columns
#' @return character
#' @concept get
#' @rdname get_methods
#' @export
get_teams    <- function(){
  names(.slack$teams)
}

#' @rdname get_methods
#' @export
get_team_env <- function(){
  sapply(
    sprintf('SLACK_%s',toupper(.slack$env_fields)),Sys.getenv
  )
}

#' @rdname get_methods
#' @export
get_active_team  <- function(){

  team <- .slack$current_team

  if(is.null(team)){
    message('No active team')
  }

  team

}

#' @rdname get_methods
#' @export
get_team_creds <- function(team){

  idx <- which(team%in%get_teams())

  if(length(idx)!=length(team)){

    if(!length(idx)){
      miss_team <- paste0(team[seq_along(team)],collapse = ', ')
    }else{
      miss_team <- paste0(team[-idx],collapse = ', ')
    }
    msg_names <- 'Use the get_teams() to return the stored team names'
    msg <- sprintf("Team '%s' not found\n%s", miss_team,msg_names)
    return(message(msg))

    team <- team[idx]

  }

  .slack$teams[team]

}

#' @rdname get_methods
#' @export
get_team_users <- function(team,fields = c('id','name','title','real_name')){

  if(missing(team)){
    team <- get_active_team()
  }

  users <- .slack$users[[team]]

  if(!is.null(fields))
    users <- users[,fields]

  users

}

#' @rdname get_methods
#' @export
get_team_channels <- function(team,fields = NULL){

  if(missing(team)){
    team <- get_active_team()
  }

  chnls <- .slack$channels[[team]]

  if(!is.null(fields))
    chnls <- chnls[,fields]

  chnls

}
