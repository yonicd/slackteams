# Set up tests. ---------------------------------------------------------------
# While this *could* go into a setup.R file, that makes interactive testing
# annoying. I compromised and put it in a collapsible block at the top of each
# test file.

# To test the API:

# Sys.setenv(SLACK_API_TEST_MODE = "true")

# To capture test data:

# Sys.setenv(SLACK_API_TEST_MODE = "capture")

# To go back to a "normal" mode:

# Sys.unsetenv("SLACK_API_TEST_MODE")

slack_api_test_mode <- Sys.getenv("SLACK_API_TEST_MODE")
withr::defer(rm(slack_api_test_mode))

library(httptest)

# All tests use #slack-r on slackr-test (or a mocked version of it).
slack_test_channel <- "CNTFB9215"
withr::defer(rm(slack_test_channel))

if (slack_api_test_mode == "true" || slack_api_test_mode == "capture") {
  # In these modes we need a real API token. If one isn't set, this should throw
  # an error right away.
  if (Sys.getenv("SLACK_API_TOKEN") == "") {
    stop(
      "No SLACK_API_TOKEN available, cannot test. \n",
      "Unset SLACK_API_TEST_MODE to use mock.")
  }

  if (slack_api_test_mode == "true") {
    # Override the main mock function from httptest, so we use the real API.
    with_mock_api <- force
  } else {
    # This tricks httptest into capturing results instead of actually testing.
    with_mock_api <- httptest::capture_requests
  }
  withr::defer(rm(with_mock_api))
}

# Tests. -----------------------------------------------------------------------

test_that("No active team reported gracefully", {
  # None of these will hit the api, so no need to mock.
  expect_error(
    get_team_creds(),
    'No active team'
  )
  expect_error(
    get_team_users(),
    'No active team'
  )
  expect_error(
    validate_team('foo'),
    'teams are not loaded'
  )
})

test_that("Loading and saving a team works", {
  add_team(team = "slackr", token = Sys.getenv('SLACK_API_TOKEN'))

  expect_error(
    validate_team('foo'),
    "team 'foo' not in loaded"
  )

  expect_message(
    activate_team("slackr"),
    "variables are set to 'slackr'"
  )

  path <- withr::local_tempfile()
  expect_error(slackteams(path), NA)
  expect_true(file.exists(path))

  expect_message(
    load_teams(file = path),
    "slackr"
  )

  expect_identical(
    get_teams(),
    "slackr"
  )

  expect_identical(
    .slack$teams$slackr,
    Sys.getenv('SLACK_API_TOKEN')
  )
})

test_that("Channel info loads for active team", {
  expect_error(
    with_mock_api({
      channels <- get_team_channels(get_active_team())
    }),
    NA
  )

  valid_channel <- validate_channel("random")

  expect_identical(valid_channel, "CNRKL1JLQ")
  expect_identical(
    validate_channel(valid_channel), valid_channel
  )
  expect_error(
    validate_channel("foo"),
    "Unknown channel"
  )
})
