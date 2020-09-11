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

info <- slackteams:::get_team_info(token = Sys.getenv('SLACK_API_TOKEN'))
add_team(info$team$name,Sys.getenv('SLACK_API_TOKEN'))

testthat::describe('load team',{

  it('validate team bad name error',{
    testthat::expect_error(
      slackteams:::validate_team('foo'),
      "team 'foo' not in loaded"
    )
  })

  it('activate team',{
    testthat::expect_message(
      activate_team('slackr'),
      regexp = "variables are set to 'slackr'")
  })

  it('slackteams to json',{
    slackteams('test_team')
    testthat::expect_true(
      file.exists('test_team')
    )
  })

  it('slackteams to dcf',{
    testthat::expect_message(
      load_teams(file = 'test_team'),
      regexp = 'slackr')
  })

  it('get teams',{
    testthat::expect_equal(
      slackteams::get_teams(),
      c('slackr')
    )
  })

  it('cached slack creds token',{
    testthat::expect_true(
      grepl('^xoxp',slackteams:::.slack$teams$slackr)
    )
  })

})

testthat::describe('active team channel info',{

  chnls <- get_team_channels(get_active_team())

  chnl <- slackteams::validate_channel('random')

  it('validate channel',{
    testthat::expect_equal(chnl, "CNRKL1JLQ")
  })

  it('validate channel id',{
    testthat::expect_equal(slackteams::validate_channel(chnl),chnl)
  })

  it('validate bad channel',{
    testthat::expect_error(slackteams::validate_channel('foo'),regexp = 'Unknown channel')
  })

})

unlink('test_team')

