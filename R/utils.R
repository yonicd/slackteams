query_piece <- function(argument, query_target) {
  if (is.null(argument)) {
    NULL
  } else {
    paste0("&", query_target, "=", argument)
  }
}

`%||%` <- function(x, y) {
  if (is.null(x)) {
    y
  } else{
    x
  }
}
