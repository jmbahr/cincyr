#' Bring in your Socrata API token.
#'
#' @param token_name The name attached to the Socrata API token in a .Renviron file.
#' @return The Socrata API token stored in a .Renviron file.

get_token <- function(token_name = "SOCRATA_API_TOKEN") {
  Sys.getenv(token_name)
}
