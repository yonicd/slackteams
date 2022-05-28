.onLoad <- function(lib,pkg) {

if(isFALSE(as.logical(Sys.getenv('SLACK_SKIPLOAD')))){
  if(nzchar(Sys.getenv('SLACK_API_TOKEN'))&interactive()){
    info <- get_team_info(token = Sys.getenv('SLACK_API_TOKEN'))
    add_team(info$team$name,Sys.getenv('SLACK_API_TOKEN'))
    activate_team(info$team$name)
  }
}
}

.onAttach <- function(lib,pkg) {
}
