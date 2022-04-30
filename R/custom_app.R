#' Custom App Helper
#'
#' Create a manifest for a custom Slack App. See the Slack Apps vignette for
#' details about using custom Slack Apps.
#'
#' @param app_name character; a name to give to your custom app.
#' @param redirect_urls character; urls to which the app can be redirected
#'   during authentication. We recommend including localhost on a specific port
#'   (eg, http://127.0.0.1:4242) for testing, and often a shinyapps.io url.
#' @param description character; an optional one-sentence description of your
#'   app. If this parameter is NULL, an adequate description is provided.
#' @param long_description character; an optional paragraph (or more) giving
#'   more details about your app. This field supports markdown. If this
#'   parameter is NULL, an adequate long description is provided.
#'
#' @return The app manifest as an editable R object, invisibly.
#' @export
#'
#' @examples
#' create_custom_app(
#'   app_name = "my_cool_app",
#'   redirect_urls = c("http://127.0.0.1:4242", "myapp.shinyapps.io")
#' )
create_custom_app <- function(app_name,
                              redirect_urls = NULL,
                              description = NULL,
                              long_description = NULL) {
  this_app <- yaml::read_yaml(
    system.file("app_manifest.yml", package = "slackteams")
  )
  this_app$display_information$name <- app_name

  if (!is.null(redirect_urls)) {
    this_app$oauth_config$redirect_urls <- redirect_urls
  }
  if (!is.null(description)) {
    this_app$display_information$description <- description
  }
  if (!is.null(long_description)) {
    this_app$display_information$long_description <- long_description
  }

  cat(
    "Visit https://api.slack.com/apps & Create New App",
    "Copy/paste this manifest:",
    sep = "\n"
  )
  custom_app_yaml(this_app)
  return(invisible(this_app))
}

#' Prepare an App Manifest
#'
#' Convert an app manifest list object to a yaml for upload.
#'
#' @param app_manifest list; an app manifest such as the one returned by
#'   \code{\link{create_custom_app}}.
#'
#' @return The manifest in yaml format (invisibly).
#' @export
#'
#' @examples
#' my_manifest <- create_custom_app("myApp")
#' my_manifest$`_metadata`$minor_version <- 1L
#' custom_app_yaml(my_manifest)
custom_app_yaml <- function(app_manifest) {
  app_manifest_yaml <- yaml::as.yaml(app_manifest)
  cat(app_manifest_yaml)
  return(invisible(app_manifest_yaml))
}
