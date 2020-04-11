testthat::context('team management')

testthat::describe('no active team',{

  it('get_team_creds',{
    testthat::expect_error(
      get_team_creds(),
      'No active team'
    )
  })

  it('get_team_users',{
    testthat::expect_error(
      get_team_users(),
      'No active team'
    )
  })

  it('validate team missing teams error',{
    testthat::expect_error(
      slackteams:::validate_team('foo'),
      'teams are not loaded'
    )
  })

})

testthat::describe('load team',{

  it('slackteams verbose',{
    testthat::expect_message(
      load_teams(file = 'test_team'),
      regexp = 'test')
  })

  it('validate team bad name error',{
    testthat::expect_error(
      slackteams:::validate_team('foo'),
      "team 'foo' not in loaded"
    )
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

  # it('slackteams to dcf test',{
  #   testthat::expect_message(
  #     activeteam2dcf('test_team_dcf',file = ''),
  #     'Converting'
  #   )
  # })

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

  # it('update team file',{
  #   update_team_file('test_team')
  # })

})

testthat::describe('active team channel info',{

  chnl <- slackteams::validate_channel('random')

  it('validate channel',{
    testthat::expect_equal(chnl, "CNRKL1JLQ")
  })

  res <- slackteams:::get_channels_info(channel = chnl)

  it('class',{
    testthat::expect_s3_class(res,'channels.info')
  })

  it('validate channel id',{
    testthat::expect_equal(slackteams::validate_channel(chnl),chnl)
  })

  it('validate bad channel',{
    testthat::expect_error(slackteams::validate_channel('foo'),regexp = 'Unknown channel')
  })

})


unlink('test_team_dcf')
unlink('test_team')

