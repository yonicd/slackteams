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
  expect_error(
    with_mock_api({
      res_user_list <- get_users_list()
    }),
    NA
  )

  expect_s3_class(
    res_user_list,
    "data.frame"
  )

  expect_identical(
    colnames(res_user_list),
    c(
      "id", "team_id", "name", "deleted", "color", "real_name", "tz",
      "tz_label", "tz_offset", "is_admin", "is_owner", "is_primary_owner",
      "is_restricted", "is_ultra_restricted", "is_bot", "is_app_user",
      "updated", "is_email_confirmed", "who_can_share_contact_card",
      "has_2fa"
    )
  )

  expect_identical(
    nrow(res_user_list),
    3L
  )

  expect_identical(
    res_user_list$id,
    c("USLACKBOT", "UNTFB8LTH", "U0111B8S0LX")
  )
})

test_that("Conversation list loads", {
  expect_error(
    with_mock_api({
      res_convo_list <- get_conversations_list()
    }),
    NA
  )

  expect_s3_class(
    res_convo_list,
    "data.frame"
  )

  expect_identical(
    colnames(res_convo_list),
    c(
      "id", "name", "is_channel", "is_group", "is_im", "is_mpim",
      "is_private", "created", "is_archived", "is_general", "unlinked",
      "name_normalized", "is_shared", "is_org_shared", "is_pending_ext_shared",
      "context_team_id", "updated", "creator", "is_ext_shared", "is_member",
      "num_members", "user", "is_user_deleted", "priority"
    )
  )

  expect_identical(
    nrow(res_convo_list[!res_convo_list$is_im, ]),
    3L
  )

  expect_identical(
    res_convo_list[!res_convo_list$is_im, ]$id,
    c("CNRKL1H6C", "CNRKL1JLQ", "CNTFB9215")
  )
})

test_that("Convo info loads", {
  expect_error(
    with_mock_api({
      res_convo_info <- get_conversations_info(slack_test_channel)
    }),
    NA
  )

  expect_s3_class(
    res_convo_info,
    c("conversations.info", "list")
  )

  expect_identical(
    names(res_convo_info),
    c("ok", "channel")
  )

  expect_true(res_convo_info$ok)

  expect_identical(
    names(res_convo_info$channel),
    c(
      "id", "name", "is_channel", "is_group", "is_im", "is_mpim",
      "is_private", "created", "is_archived", "is_general", "unlinked",
      "name_normalized", "is_shared", "is_org_shared", "is_pending_ext_shared",
      "pending_shared", "context_team_id", "updated", "parent_conversation",
      "creator", "is_ext_shared", "shared_team_ids", "pending_connected_team_ids",
      "is_member", "last_read", "topic", "purpose", "previous_names"
    )
  )

  expect_identical(
    res_convo_info$channel$id,
    "CNTFB9215"
  )
})

test_that("Convo members load", {
  expect_error(
    with_mock_api({
      res_convo_members <- get_conversations_members(slack_test_channel)
    }),
    NA
  )

  expect_s3_class(
    res_convo_members,
    "data.frame"
  )

  expect_identical(
    colnames(res_convo_members),
    "value"
  )

  expect_identical(
    nrow(res_convo_members),
    2L
  )

  expect_identical(
    res_convo_members$value,
    c("UNTFB8LTH", "U0111B8S0LX")
  )
})
