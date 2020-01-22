call_slack <- function(foo,body){

  foo_dot <- gsub('_','.',foo)

  res <- res_validate(res = httr::POST(file.path("https://slack.com/api",foo_dot),body=body))

  structure(res,class = c(foo,class(res)))
}

parse_call <- function(){
  call_str <- deparse(sys.calls()[[1]])
  foo <- gsub('slackteams:::|\\((.*?)$','',call_str)
  gsub('get_','',foo)
}

res_validate <- function(res){

  httr::warn_for_status(res)

  res_content <- httr::content(res)

  if(!res_content$ok){
    return(res_content$error)
  }

  res_content
}

map_channel <- function(channel,type){

  channels <- get_channels()
  channel_type <- channels[[sprintf('is_%s',gsub('s$','',type))]]

  channels$id[channels$name==channel&channel_type]

}



# cont <- TRUE
# output <- list()
# output[[1]] <- res
# i <- 1
#
# while(cont){
#
#   this_cursor <- httr::content(output[[i]])$response_metadata$next_cursor
#   cont <- !is.null(this_cursor)
#   if(cont){
#     this_res <- httr::POST("https://slack.com/api/users.list",
#                            body=list(token=api_token,cursor = this_cursor))
#
#     output <- append(output,list(this_res))
#     i <- i+1
#   }
# }
