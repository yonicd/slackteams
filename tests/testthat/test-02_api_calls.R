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

test_that("User list loads", {
  expect_snapshot(
    with_mock_api({
      get_users_list()
    })
  )
})

test_that("Channel info loads", {
  # We can't just use snapshots here, because different valid users in capture
  # mode can get different IM results.

  expect_error(
    with_mock_api({
      res_convo_list <- get_conversations_list()
    }),
    NA
  )

  # Get rid of the bits that can change.
  res_convo_list <- res_convo_list[!res_convo_list$is_im, ]
  res_convo_list$updated <- NULL

  expect_snapshot(res_convo_list)

  expect_error(
    with_mock_api({
      convo_info <- get_conversations_info(slack_test_channel)
    }),
    NA
  )

  # Get rid of the bits that can change.
  convo_info$channel$last_read <- NULL
  convo_info$channel$updated <- NULL

  expect_snapshot(convo_info)

  expect_snapshot(
    with_mock_api({
      convo_members <- get_conversations_members(slack_test_channel)
    }),
    NA
  )
})
