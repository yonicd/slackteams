parse_call <- function() {
  tb <- .traceback(1)
  idx <- which(sapply(tb, function(x) grepl(x[1], pattern = "post\\_slack"))) + 1
  call_str <- tb[[idx]]
  foo <- gsub("\\((.*?)$", "", call_str)
  no_get <- gsub("^(.*?)get_", "", foo)
  gsub("\\_", ".", no_get)
}
