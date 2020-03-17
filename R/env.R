
.slack <- new.env()

# Per-team info.
assign("teams", list(), envir = .slack)
assign("creds", list(), envir = .slack)
assign("users", list(), envir = .slack)
assign("channels", list(), envir = .slack)
assign('file', list(), envir = .slack)

# General slackteams info.
assign(
  "cred_fields",
  c("channel", "incoming_webhook_url", "api_token", "username", "icon_emoji"),
  envir = .slack
)
assign(
  "env_fields",
  c("channel", "incoming_url_prefix", "api_token", "username", "icon_emoji"),
  envir = .slack
)
assign(
  "api",
  "https://slackr-auth.herokuapp.com/creds",
  envir = .slack
)
assign(
  "username",
  "slackr",
  envir = .slack
)
assign(
  "icon_emoji",
  "",
  envir = .slack
)
assign(
  "activeteam",
  NA_character_,
  envir = .slack
)

slack_setenv_msg <- function(team) {
  tmpl <- "slackr environment variables are set to '%s' supplied definitions"
  message(sprintf(tmpl, team))
}

slack_setenv <- function() {
  Sys.setenv(SLACK_CHANNEL = .slack$creds$channel)
  Sys.setenv(SLACK_USERNAME = .slack$username)
  Sys.setenv(SLACK_ICON_EMOJI = .slack$icon_emoji)
  Sys.setenv(SLACK_INCOMING_URL_PREFIX = .slack$creds$incoming_webhook_url)
  Sys.setenv(SLACK_API_TOKEN = .slack$creds$api_token)
}
