#' @title Team Managment Functions
#' @description Manage teams that can be accessed
#' @param team character, team name
#' @param verbose logical, Print messages to console, Default: TRUE
#' @return NULL
#' @concept management
#' @rdname manage_team
#' @importFrom jsonlite validate
#' @export
activate_team <- function(team, verbose = TRUE) {
  validate_team(team)

  slack_setenv(team)
  .slack$activeteam <- team
  if (verbose) {
    slack_setenv_msg(team)
  }
}

#' @rdname manage_team
#' @export
add_team <- function(team, token) {

  if(team%in%names(.slack$teams)){
    .slack$teams[[team]] <- token
  }else{
    new_team <- list(token)
    names(new_team) <- team
    .slack$teams <- append(.slack$teams, new_team)
  }


}

#' @rdname manage_team
#' @export
add_team_token <- function(team,
                           token,
                           verbose = TRUE) {
  add_team(team = team,token = token)
  .slack$file[[team]] <- ""
  .slack$creds <- list(
    api_token = token
  )

  if (verbose) {
    message(sprintf(
      "The following teams are loaded:\n  %s",
      paste0(get_teams(), collapse = ", ")
    ))
  }
}

#' @title Interactive Team Managment
#' @description Add a team interactively
#' @param scopes character, scopes to request. Must include "users:read",
#'   "channels:read", "groups:read", "im:read", and "mpim:read" at minimum.
#' @details Launch a browser window to interactively grant slackteams permission
#'   to act on your behalf on a Slack team.
#' @note This function does not currently work in an Rstudio Server setup. We
#'   are exploring options to remedy this situation.
#' @return NULL
#' @concept management
#' @export
add_team_interactive <- function(scopes = load_scopes()) {
  min_scopes <- c(
    "users:read", "channels:read", "groups:read", "im:read", "mpim:read","team:read"
  )
  if (!all(min_scopes %in% scopes)) {
    stop(
      "At a minimum, scopes must include\n",
      "users:read, channels:read, groups:read, im:read, and mpim:read"
    )
  }

  slack_oauth_app <- httr::oauth_app(
    appname = "slackteams",
    key = getOption('slack_client_id', default = client_id),
    secret = getOption('slack_client_secret', default = client_secret)
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
  if (full_token$credentials$ok) {
    token <- full_token$credentials$authed_user$access_token
    team <- full_token$credentials$team$name

    message(sprintf('\nAdding %s to loaded teams ...',team))
    add_team(team, token)

    message(sprintf('\nActivating %s ...',team))
    activate_team(team)

  } else {
    # I suspect httr might fail for us in this case, but it mirror the case that
    # ISN'T handled in add_team_code, so I added the safety in case.
    stop(
      "Failed to authenticate. Slack returned: ",
      full_token$credentials$error
    )
  }
}

#' @title Semi-Interactive Team Management
#' @description Add a team using a Slack response code.
#' @param code character, a code returned by the slack oauth2 v2 api.
#' @param redirect_uri character, the uri to which the user was redirected when
#'   the code was generated.
#' @inheritParams activate_team
#' @details Launch a browser window to interactively grant slackteams permission
#'   to act on your behalf on a Slack team.
#' two global package options control this function
#' slack_client_id character, the client_id of a Slack app. If this is not
#'   provided, the function will use the built-in R4DS Slack app.
#' slack_client_secret character, the client_secret of a Slack app. If this is
#'   not provided, the function will use the built-in R4DS Slack app.
#' @note This function does not currently work in an Rstudio Server setup. We
#'   are exploring options to remedy this situation.
#' @return The token (invisibly)
#' @concept management
#' @export
add_team_code <- function(code,
                          redirect_uri = NULL,
                          verbose = TRUE) {

  access_url <- paste0(
    access_root,
    "?code=", code,
    query_piece(redirect_uri, "redirect_uri"),
    query_piece(getOption('slack_client_id', default = client_id), "client_id"),
    query_piece(getOption('slack_client_secret', default = client_secret), "client_secret")
  )

  response <- httr::GET(
    access_url
  )
  httr::stop_for_status(response, "convert code to token")

  full_token <- httr::content(response)
  if (full_token$ok) {
    token <- full_token$authed_user$access_token
    team <- full_token$team$name
    add_team_token(team, token, verbose)
    invisible(token)
  } else {
    stop(
      "Failed to validate code. Slack returned: ",
      full_token$error
    )
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
  .slack$users[[team]] <- clean_users(get_users_list())
  .slack$channels[[team]] <- clean_channel(get_conversations_list(), team)
}

update_cache <- function() {
  slack_team_info(get_active_team())
}

#' @title Slack Authorization URL
#' @description Generate an authorization URL to add a team manually. Useful,
#'   for example, for authorizing a team in a Shiny app.
#' @param scopes character, scopes to request.
#' @param redirect_uri character, the uri to which the user should be directed
#'   after authorization. If this is NULL (default), the user will be directed
#'   to the default redirection set up in the app.
#' @param team_code character, a team code to restrict the user to (in case they
#'   have multiple Slack teams authorized in their browser).
#' @param state character, a code to send to your redirect_uri indicating a
#'   state. It is recommended to use a non-human-readable format for this
#'   string.
#' @return character, an authorization URL.
#' @export
#' @concept management
#' @examples
#' auth_url()
#' auth_url(redirect_uri = "http://127.0.0.1:4242")
#' auth_url(redirect_uri = "http://127.0.0.1:4242", team_code = "T6UC1DKJQ")
#' auth_url(state = "aabbCCddeeFF")
auth_url <- function(scopes = load_scopes(),
                     redirect_uri = NULL,
                     team_code = NULL,
                     state = NULL) {

  paste0(
    auth_root,
    "?user_scope=", paste(scopes, collapse = ","),
    "&client_id=", getOption('slack_client_id', default = client_id),
    query_piece(redirect_uri, "redirect_uri"),
    query_piece(team_code, "team"),
    query_piece(state, "state")
  )
}
