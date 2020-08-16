#' @title Manage slackteams File
#' @description Upload or Update json file containing slack tokens
#' @param file character, path to file
#' @param verbose logical, print to console, Default: TRUE
#' @param auto_unbox logical, automatically unbox all atomic vectors of length 1, Default: TRUE
#' @param pretty logical adds indentation whitespace to JSON output, Default: TRUE
#' @param ... arguments to pass to [write_json][jsonlite::write_json]
#' @return NULL
#' @concept files
#' @rdname slackteams
#' @export
#' @importFrom jsonlite write_json read_json toJSON
slackteams <- function(file, verbose = TRUE, auto_unbox = TRUE, pretty = TRUE, ...) {

  team <- get_active_team()
  new_team <- .slack$teams[team]

  if(file.exists(file)){
    current_teams <- jsonlite::read_json(file)
    if(team%in%names(current_teams)){
      current_teams[[team]] <- new_team[[1]]
    }else{
      current_teams <- append(current_teams,new_team)
    }
  }else{
    current_teams <- new_team
  }


  jsonlite::write_json(current_teams, file,
    auto_unbox = auto_unbox,
    pretty = pretty, ...
  )

  if (verbose) {
    jsonlite::toJSON(current_teams,
      auto_unbox = auto_unbox,
      pretty = pretty, ...
    )
  }
}

#' @title Load Team(s) From File
#' @description Load teams from local file that contains slack tokens
#' @param file character, Path to json containing tokens, Default: '~/.slackteams'
#' @param verbose logical, Print message after loading, Default: TRUE
#' @return NULL
#' @concept files
#' @rdname load_teams
#' @export
load_teams <- function(file = "~/.slackteams", verbose = TRUE) {

  if (file.exists(file)) {

    jsn <- jsonlite::read_json(file)

    for(team in names(jsn)){
      .slack$teams[[team]] <- jsn[[team]]
      .slack$file[[team]] <- file
      .slack$creds[['api_token']] <- jsn[[team]]
    }

  }

  # Set any that aren't set to "".
  for (i in .slack$cred_fields[-3]) {
    .slack$creds[[i]] <- ""
  }

  if (verbose) {
    message(sprintf(
      "The following teams are loaded:\n  %s",
      paste0(get_teams(), collapse = ", ")
    ))
  }

}
