
.slack <- new.env()

assign('teams', list(), envir = .slack)
assign('creds', list(), envir = .slack)
assign('users', list(), envir = .slack)
assign('channels', list(), envir = .slack)

assign('cred_fields', c('channel','incoming_webhook_url','api_token','username','icon_emoji'), envir = .slack)
assign('env_fields' , c('channel','incoming_url_prefix','api_token','username','icon_emoji'), envir = .slack)
assign('api', 'https://slackr-auth.herokuapp.com/creds', envir = .slack)
assign('username', 'slackr', envir = .slack)
assign('icon_emoji', '', envir = .slack)
assign('file', NA_character_, envir = .slack)
