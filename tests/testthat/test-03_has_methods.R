# Tests ------------------------------------------------------------------------

test_that("Can check for active team.", {
  # At this point in the process, a team has been activated.
  expect_true(has_active_team())
})
