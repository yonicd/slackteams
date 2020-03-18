#' @title Team Managment Functions
#' @description Manage teams that can be accessed
#' @param team character, team name
#' @param verbose logical, Print messages to console, Default: TRUE
#' @param memberid character, member id of user in the team
#' @param key character, slackr-app key unique to the memberid
#' @param token character, api token issued by slack
#' @details If the team credentials are last loaded via load_teams() then when
#'   activating a team slackrapp will be called to retrieve private webhook
#'   information needed to interact with Slack API. If the team credentials are
#'   last loaded via load_team_dcf() the private webhook is assumed to be
#'   located in the file.
#' @return NULL
#' @concept managment
#' @rdname manage_team
#' @importFrom jsonlite validate
#' @export
activate_team <- function(team, verbose = TRUE) {
  validate_team(team)

  if(
    .slack$file[[team]] != "" &&
    jsonlite::validate(txt = readLines(.slack$file[[team]]))
  ){
    get_slackrapp(team)
  }

  slack_setenv()
  slack_team_info(team)
  .slack$activeteam <- team
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
add_team_token <- function(team, token) {
  .slack$teams[[team]] <- "token"
  .slack$file[[team]] <- ""
  .slack$creds <- list(
    channel = "",
    incoming_webhook_url = "",
    api_token = token,
    username = "",
    icon_emoji = ""
  )
}

#' @title Interactive Team Managment
#' @description Add a team interactively
#' @param scopes character, scopes to request. Must include "users:read",
#'   "channels:read", "groups:read", "im:read", and "mpim:read" at minimum.
#' @inheritParams activate_team
#' @details Launch a browser window to interactively grant slackteams permission
#'   to act on your behalf on a Slack team.
#' @note This function does not currently work in an Rstudio Server setup. We
#'   are exploring options to remedy this situation.
#' @return NULL
#' @export
add_team_interactive<- function(scopes = c("users:read",
                                           "channels:read",
                                           "groups:read",
                                           "im:read",
                                           "mpim:read"),
                                verbose = TRUE) {
  min_scopes <- c(
    "users:read", "channels:read", "groups:read", "im:read", "mpim:read"
  )
  if (!all(
    min_scopes %in%
    scopes
  )) {
    stop(
      "At a minimum, scopes must include\n",
      "users:read, channels:read, groups:read, im:read, and mpim:read"
    )
  }

  slack_oauth_app <- httr::oauth_app(
    appname = "slackteams",
    key = client_id,
    secret = client_secret
  )
  full_token <- httr::oauth2.0_token(
    endpoint = slack_oauth_endpoint,
    app = slack_oauth_app,
    query_authorize_extra = list(
      user_scope = paste(
        scopes,
        collapse = ","
      )
    ),
    cache = FALSE,
    use_oob = FALSE
  )
  token <- full_token$credentials$authed_user$access_token
  team <- full_token$credentials$team$name
  add_team_token(team, token)

  if (verbose) {
    message(sprintf(
      "The following teams are loaded:\n  %s",
      paste0(get_teams(), collapse = ", ")
    ))
  }
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

