client_id <- "232409461636.994370873922"
client_secret <- "3327df26a999c8081f62b6fa6d9f4f5e"
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
