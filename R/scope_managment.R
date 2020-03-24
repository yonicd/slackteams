yml2scopes <- function(y){

  idx <- which(sapply(y[[1]],inherits,what = 'list'))

  if(length(idx)>0){
    y[[1]][[idx]] <- yml2scopes(y[[1]][[idx]])
  }

  if(is.null(names(y))){
    y[[1]]
  }else{
    paste(names(y),y[[1]],sep=':')
  }


}

#' @export
scopes <- function(file = system.file('scopes.yml',package = 'slackteams'), which = 'base'){
  yml <- yaml::read_yaml(file)
  ret <- lapply(yml,function(x) unlist(lapply(x,yml2scopes)))
  ret[[which]]
}
