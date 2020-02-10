#' @title Load Team(s) From File
#' @description Load teams from local file that contains slackr-app keys
#' @param file character, Path to json containing slackr-app keys, Default: '~/.slackteams'
#' @param verbose logical, Print message after loading, Default: TRUE
#' @return NULL
#' @concept files
#' @rdname load_teams
#' @export
load_teams <- function(file = "~/.slackteams", verbose = TRUE) {

  upload_team_file(file)

  if (verbose) {
    message(sprintf(
      "The following teams are loaded:\n  %s",
      paste0(get_teams(), collapse = ", ")
    ))
  }

  return(invisible(NULL))
}

#' @title Load Team(s) From File
#' @description Load teams from local file that contains slack API definitions
#'   that are slackr compatible
#' @param team character, name of team, Default: 'user'
#' @param file character, Path to dcf containing slackr compatible fields, Default: '~/.slackr'
#' @param verbose logical, Print message after loading, Default: TRUE
#' @return NULL
#' @concept files
#' @rdname load_team_dcf
#' @export
load_team_dcf <- function(team = 'user',file = "~/.slackr", verbose = TRUE) {

  res <- read.dcf(file)

  for (i in intersect(colnames(res), .slack$cred_fields)) {
    if (i %in% c("username", "icon_emoji")) {
      assign(i, res[[1, i]], envir = .slack)
    } else {
      .slack$creds[[i]] <- res[[1, i]]
    }
  }

  .slack$teams[[team]] <- 'dcf'
  .slack$file[[team]] <- file

  if (verbose) {
    message(sprintf(
      "The following teams are loaded:\n  %s",
      paste0(get_teams(), collapse = ", ")
    ))
  }

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
upload_team_file <- function(file) {

  file <- catch_slackr_json(file)

  if (file.exists(file)) {

    jsn <- jsonlite::read_json(file)

    for(team in names(jsn)){
      .slack$teams[[team]] <- jsn[[team]]
      .slack$file[[team]] <- file
    }

  }
}


#' @rdname team_files
#' @export
#' @importFrom jsonlite write_json toJSON
update_team_file <- function(file, verbose = TRUE, auto_unbox = TRUE, pretty = TRUE, ...) {
  jsonlite::write_json(get_team_creds(get_teams()), file,
    auto_unbox = auto_unbox,
    pretty = pretty, ...
  )

  if (verbose) {
    jsonlite::toJSON(get_team_creds(get_teams()),
      auto_unbox = auto_unbox,
      pretty = pretty, ...
    )
  }
}

#' @title Create slackr dcf file
#' @description Convert the active team to a slackr compatible dcf file on the local system
#' @param file character, path to write the dcf file to, Default: '~/.slackr'
#' @param verbose logical, Print messages to console, Default: TRUE
#' @details If the file is "" then the output will be printed to the console
#' @return NULL
#' @concept files
#' @rdname activeteam2dcf
#' @export
activeteam2dcf <- function(file = '~/.slackr', verbose = TRUE) {

  team <- get_active_team()

  if(verbose){
    if(nzchar(file)){
      message(sprintf("Converting and writing the active team ('%s') to a {slackr} compatible dcf file at %s",team,file))
    }else{
      message(sprintf("Converting the active team ('%s') to a {slackr} compatible dcf file",team))
    }
  }

  vars <- Sys.getenv(c('SLACK_CHANNEL','SLACK_USERNAME','SLACK_ICON_EMOJI','SLACK_INCOMING_URL_PREFIX','SLACK_API_TOKEN'))
  vars <- vars[nzchar(vars)]
  names(vars) <- tolower(gsub('^SLACK_','',names(vars)))
  vars_df <- as.data.frame(t(vars),stringsAsFactors = FALSE)
  names(vars_df)[grepl('^incoming',names(vars_df))] <- 'incoming_webhook_url'

  write.dcf(vars_df, file = file)
}

catch_slackr_json <- function(file){

  old_path <- '~/slackr.json'
  deprec_msg <- "'slackr.json' is being deprecated\n  Please rename 'slackr.json' to '.slackteams'\n\n"

  if(file==old_path){

    message(deprec_msg)

  }else{

    if(!file.exists(file)&file.exists(old_path)){
      message(deprec_msg)
      file <- old_path
    }

  }

  file
}
