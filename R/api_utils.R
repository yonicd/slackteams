call_slack <- function(foo, body) {
  foo_dot <- gsub("_", ".", foo)

  res <- res_validate(res = httr::POST(file.path("https://slack.com/api", foo_dot), body = body))

  cursor <- NULL

  if ("response_metadata" %in% names(res)) {
    cursor <- res[["response_metadata"]][["next_cursor"]]
  }

  structure(res, class = c(foo, class(res)), call = foo, cursor = cursor, body = body)
}

parse_call <- function() {
  tb <- .traceback(1)
  idx <- which(sapply(tb, function(x) grepl(x[1], pattern = "^call\_slack"))) + 1
  call_str <- tb[[idx]]
  foo <- gsub("\((.*?)$", "", call_str)
  gsub("get_", "", foo)
}

res_validate <- function(res) {
  httr::warn_for_status(res)

  res_content <- httr::content(res)

  if (!res_content$ok) {
    return(res_content$error)
  }

  res_content
}

map_channel <- function(channel, type) {
  channels <- get_channels()
  channel_type <- channels[[sprintf("is_%s", gsub("s$", "", type))]]

  channels$id[channels$name == channel & channel_type]
}


paginate <- function(res, limit = NULL) {
  cont <- TRUE
  output <- list()
  output[[1]] <- res
  i <- 1

  if (is.null(attr(output[[i]], "cursor"))) {
    return(res)
  }

  while (cont) {
    this_body <- attr(output[[i]], "body")
    this_body$cursor <- attr(output[[i]], "cursor")
    this_body$limit <- limit

    cont <- nzchar(this_body$cursor)

    if (cont) {
      this_res <- call_slack(attr(res, "call"), body = this_body)

      output <- append(output, list(this_res))

      i <- i + 1
    }
  }

  el <- setdiff(names(res), c("ok", "response_metadata"))
  res[[el]] <- purrr::reduce(purrr::map(output, function(x, what) x[[what]], what = el), append)

  res
}
