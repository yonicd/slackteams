clean_users <- function(obj) {
  obj[!obj$deleted, ]
}

clean_channel <- function(obj, team) {
  users <- .slack$users[[team]]

  cols <- c("id", "name", "user", "num_members", "is_channel", "is_im", "is_private", "is_mpim", "is_group")
  channels <- obj[!obj$is_archived, intersect(cols, names(obj))]
  channels$name[channels$is_im] <- users$name[match(channels$user[channels$is_im], users$id)]
  channels$is_channel[channels$is_im] <- FALSE
  channels$is_private[channels$is_im] <- FALSE
  channels$is_mpim[channels$is_im] <- FALSE
  channels$is_group[channels$is_im] <- FALSE

  channels
}
