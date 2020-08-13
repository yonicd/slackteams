# @importFrom httr content GET
# get_slackrapp <- function(team) {
#   creds <- get_team_creds(team)
#
#   if (length(creds) > 1) {
#     message(sprintf("Only the first team (%s) will be used", team[1]))
#   }
#
#   URI <- file.path(.slack$api, creds[[1]]$memberid, creds[[1]]$key)
#
#   .slack$creds <- httr::content(httr::GET(URI))
# }

# @title Load Team(s) From File
# @description Load teams from local file that contains slack API definitions
#   that are slackr compatible
# @param team character, name of team, Default: 'user'
# @param file character, Path to dcf containing slackr compatible fields, Default: '~/.slackr'
# @param verbose logical, Print message after loading, Default: TRUE
# @return NULL
# @concept files
# @rdname load_team_dcf
# @export
# load_team_dcf <- function(team = 'user',file = "~/.slackr", verbose = TRUE) {
#
#   res <- read.dcf(file)
#
#   for (i in intersect(colnames(res), .slack$cred_fields)) {
#     if (i %in% c("username", "icon_emoji")) {
#       assign(i, res[[1, i]], envir = .slack)
#     } else {
#       .slack$creds[[i]] <- res[[1, i]]
#     }
#   }
#
#   # Set any that aren't set to "".
#   for (i in setdiff(.slack$cred_fields, colnames(res))) {
#     .slack$creds[[i]] <- ""
#   }
#
#   .slack$teams[[team]] <- 'dcf'
#   .slack$file[[team]] <- file
#
#   if (verbose) {
#     message(sprintf(
#       "The following teams are loaded:\n  %s",
#       paste0(get_teams(), collapse = ", ")
#     ))
#   }
#
# }

# @title Create slackr dcf file
# @description Convert the active team to a slackr compatible dcf file on the local system
# @param file character, path to write the dcf file to, Default: '~/.slackr'
# @param verbose logical, Print messages to console, Default: TRUE
# @details If the file is "" then the output will be printed to the console
# @return NULL
# @concept files
# @rdname activeteam2dcf
# @export
# activeteam2dcf <- function(file = '~/.slackr', verbose = TRUE) {
#
#   team <- get_active_team()
#
#   if(verbose){
#     if(nzchar(file)){
#       message(sprintf("Converting and writing the active team '%s' to a slackr package compatible dcf file at:\n%s",team,normalizePath(file,mustWork = FALSE)))
#     }else{
#       message(sprintf("Converting the active team ('%s') to a {slackr} compatible dcf file",team))
#     }
#   }
#
#   vars <- Sys.getenv(c('SLACK_CHANNEL','SLACK_USERNAME','SLACK_ICON_EMOJI','SLACK_INCOMING_URL_PREFIX','SLACK_API_TOKEN'))
#   vars <- vars[nzchar(vars)]
#   names(vars) <- tolower(gsub('^SLACK_','',names(vars)))
#   vars_df <- as.data.frame(t(vars),stringsAsFactors = FALSE)
#   names(vars_df)[grepl('^incoming',names(vars_df))] <- 'incoming_webhook_url'
#
#   write.dcf(vars_df, file = file)
# }

# catch_slackr_json <- function(file){
#
#   old_path <- '~/slackr.json'
#   deprec_msg <- "'slackr.json' is being deprecated\n  Please rename 'slackr.json' to '.slackteams'\n\n"
#
#   if(file==old_path){
#
#     message(deprec_msg)
#
#   }else{
#
#     if(!file.exists(file)&file.exists(old_path)){
#       message(deprec_msg)
#       file <- old_path
#     }
#
#   }
#
#   file
# }


# load_teams_old <- function(file = "~/.slackteams", verbose = TRUE) {
#
#   upload_team_file(file)
#
#   if (verbose) {
#     message(sprintf(
#       "The following teams are loaded:\n  %s",
#       paste0(get_teams(), collapse = ", ")
#     ))
#   }
#
#   return(invisible(NULL))
# }
