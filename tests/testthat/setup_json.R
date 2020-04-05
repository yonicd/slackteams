jsonlite::write_json(list(test = list(
    key = Sys.getenv('SLACKR_TOKEN'),
    memberid = Sys.getenv('SLACKR_MEMBERID'))
  ),
  auto_unbox = TRUE,pretty = TRUE,path = 'test_team')
