tidy_slack <- function(res) {
  UseMethod("tidy_slack")
}

tidy_slack.conversations_members <- function(res) {
  unlist(res$members)
}

#' @importFrom tibble as_tibble
#' @importFrom purrr map_df
tidy_slack.users_list <- function(res) {
  members <- res$members

  cols <- lapply(members, names)

  member_info <- purrr::map_df(members, function(x) {
    cols <- setdiff(names(x), c("profile", "real_name", "tz"))
    tibble::as_tibble(x[cols])
  })

  member_profile <- purrr::map_df(members, function(x) {
    cols <- setdiff(names(x$profile), c("fields"))
    tibble::as_tibble(x$profile[cols])
  })

  tibble::as_tibble(cbind.data.frame(member_info, member_profile, stringsAsFactors = FALSE))
}

#' @importFrom tibble as_tibble
#' @importFrom purrr map_df map_lgl
tidy_slack.default <- function(res) {
  fields <- c("channel", "channels", "groups", "conversations","members")

  el <- intersect(names(res), fields)

  purrr::map_df(res[[el]], function(x) {
    cols <- !purrr::map_lgl(x, inherits, what = c("NULL", "list"))
    tibble::as_tibble(x[cols])
  })
}
