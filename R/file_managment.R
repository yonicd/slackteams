#' @title Load Team(s) From File
#' @description Load teams from local file that contains slackr-app keys
#' @param file character, Path to json containing slackr-app keys, Default: '~/slackr.json'
#' @param verbose logical, Print message after loading, Default: TRUE
#' @return NULL
#' @concept files
#' @rdname load_teams
#' @export
load_teams <- function(file = '~/slackr.json',verbose = TRUE) {

  upload_team_file(file)

  if(verbose){
    message(sprintf("The following teams are loaded:\n  %s",
                    paste0(get_teams(),collapse = ', ')))
  }

  return(invisible(NULL))
}

#' @rdname load_teams
#' @export
load_teams_dcf <- function(file = '~/.slackr', verbose = TRUE){

  res <- read.dcf(file)

  for(i in intersect(colnames(res),.slack$cred_fields)){

    if(i%in%c('username','icon_emoji')){

      assign(i,res[[1,i]],envir = .slack)

    }else{

      .slack$creds[[i]] <- res[[1,i]]

    }

  }

  slack_setenv()

  if(verbose)
    slack_setenv_msg(team = 'user')

}


#' @title Manage Team Files
#' @description Upload or Update json file containing slackr-app keys
#' @param file character, path to file
#' @param verbose logical, print to console, Default: TRUE
#' @param auto_unbox logical, automatically unbox all atomic vectors of length 1, Default: TRUE
#' @param pretty logical adds indentation whitespace to JSON output, Default: TRUE
#' @param ... arguments to pass to [write_json][jsonlite::write_json]
#' @return NULL
#' @rdname team_files
#' @export
#' @importFrom jsonlite read_json
upload_team_file  <- function(file){

  if(file.exists(file)){

    jsn <- jsonlite::read_json(file)

    new_teams <- setdiff(names(jsn),names(.slack$teams))

    .slack$teams <- append(.slack$teams,jsn[new_teams])

    assign('file',file,envir = .slack)
  }

}


#' @rdname team_files
#' @export
#' @importFrom jsonlite write_json toJSON
update_team_file  <- function(file, verbose = TRUE, auto_unbox = TRUE, pretty = TRUE,...){

  jsonlite::write_json(get_team_creds(get_teams()),file,
                       auto_unbox = auto_unbox,
                       pretty = pretty,...)

  if(verbose){

    jsonlite::toJSON(get_team_creds(get_teams()),
                     auto_unbox = auto_unbox,
                     pretty = pretty,...)

  }
}
