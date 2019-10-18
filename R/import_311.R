#' @title Import Cincinnati 3-1-1 Calls
#'
#' @description Easily import 3-1-1 data with a set of filters
#'
#' @param start_date start date for period of analysis
#' @param end_date end date for period of analysis
#' @param agency_responsible character vector consisting of government agencies of interest
#' @param api_token Socrata API token used for querying the API
#'
#' @return data frame consisting of 3-1-1 call data based on input filters
#'
#' @import RSocrata
#'
#' @export
#'
#' @examples
#' # create objects to be used as filter arguments
#' start_date <- '2019-10-01'
#' end_date <- '2019-10-10'
#' agency_responsible <- c('Public Services', 'Police Department')
#' socrata_token <- get_token()
#'
#' # call function with selected filter arguments
#' import_311(start_date = start_date,
#'            end_date = end_date,
#'            agency_responsible = agency_responsible,
#'            api_token = socrata_token)
#'


import_311 <- function(start_date,
                       end_date = Sys.Date(),
                       agency_responsible = NULL,
                       api_token){

  date_filter <- sub(pattern = "date_name",
                     replacement = "requested_datetime",
                     x = generate_date_filter(start_date, end_date))

  agency_filter <- paste0("(agency_responsible IN ('", paste0(agency_responsible, collapse="','"), "'))")


  soda_query <- paste0("https://data.cincinnati-oh.gov/resource/4cjh-bm8b.json",
                       "?$where= ",
                       date_filter,
                       " AND ",
                       agency_filter
                       )


  data311 <- read.socrata(soda_query, app_token = api_token)

  data311

}


