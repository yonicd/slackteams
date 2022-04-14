builtin_client_id <- "232409461636.994370873922"
builtin_client_secret <- "3327df26a999c8081f62b6fa6d9f4f5e"
auth_root <- "https://slack.com/oauth/v2/authorize"
access_root <- "https://slack.com/api/oauth.v2.access"
slack_oauth_endpoint <- httr::oauth_endpoint(
  authorize = auth_root,
  access = access_root
)

usethis::use_data(
  builtin_client_id,
  builtin_client_secret,
  auth_root,
  access_root,
  slack_oauth_endpoint,
  internal = TRUE, overwrite = TRUE
)

rm(
  builtin_client_id,
  builtin_client_secret,
  auth_root,
  access_root,
  slack_oauth_endpoint
)
