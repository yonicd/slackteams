#' @keywords internal
tidy_slack <- function(res) {
  UseMethod("tidy_slack")
}

tidy_slack.conversations_members <- function(res) {
  unlist(res$members)
}

#' @importFrom tibble as_tibble
#' @importFrom data.table rbindlist
tidy_slack.users_list <- function(res) {
  members <- res$members

  cols <- lapply(members, names)

  member_info_list <- lapply(members, function(x) {
    cols <- setdiff(names(x), c("profile", "real_name", "tz"))
    tibble::as_tibble(x[cols])
  })

  member_info <- tibble::as_tibble(data.table::rbindlist(member_info_list,fill=TRUE))

  member_profile_list <- lapply(members, function(x) {
    cols <- setdiff(names(x$profile), c("fields"))
    tibble::as_tibble(x$profile[cols])
  })

  member_profile <- tibble::as_tibble(data.table::rbindlist(member_profile_list,fill=TRUE))

  tibble::as_tibble(cbind.data.frame(member_info, member_profile, stringsAsFactors = FALSE))
}

#' @importFrom tibble as_tibble
#' @importFrom data.table rbindlist
tidy_slack.default <- function(res) {
  fields <- c("channel", "channels", "groups", "conversations","members")

  el <- intersect(names(res), fields)

  el_list <- lapply(res[[el]], function(x) {
    cols <- !unlist(lapply(x, inherits, what = c("NULL", "list")))
    tibble::as_tibble(x[cols])
  })

  tibble::as_tibble(data.table::rbindlist(el_list,fill=TRUE))
}
