client_id <- "232409461636.989252639459"
client_secret <- "8615cdd72230109d2811b57ca60e8002"
slack_oauth_endpoint <- httr::oauth_endpoint(
  authorize = "https://slack.com/oauth/v2/authorize",
  access = "https://slack.com/api/oauth.v2.access"
)

usethis::use_data(
  client_id,
  client_secret,
  slack_oauth_endpoint,
  internal = TRUE, overwrite = TRUE
)
