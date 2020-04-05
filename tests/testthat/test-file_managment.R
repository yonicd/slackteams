testthat::context('team management')

testthat::describe('load team',{

  it('slackteams verbose',{
    testthat::expect_message(
      load_teams(file = 'test_team'),
      regexp = 'test')
  })

  it('slackteams not verbose',{
    testthat::expect_true(
      length(capture.output(load_teams(file = 'test_team',verbose = FALSE)))==0
    )
  })

  it('activate team',{
    testthat::expect_message(
      activate_team('test'),
      regexp = "variables are set to 'test'")
  })

  it('slackteams to dcf',{
    activeteam2dcf('test_team_dcf')
    testthat::expect_true(
      file.exists('test_team_dcf')
    )
  })

  it('slackteams to dcf',{
    testthat::expect_message(
      load_team_dcf(team = 'team_dcf',file = 'test_team_dcf'),
      regexp = 'test, team_dcf')
  })

  it('get teams',{
    testthat::expect_equal(
      slackteams::get_teams(),
      c('test','team_dcf')
    )
  })

  it('cached slack creds channel',{
    testthat::expect_true(
      grepl('^\\#random',slackteams:::.slack$creds$channel)
      )
  })

  it('cached slack creds token',{
    testthat::expect_true(
      grepl('^xoxp',slackteams:::.slack$creds$api_token)
    )
  })

})

unlink('test_team_dcf')
unlink('test_team')

