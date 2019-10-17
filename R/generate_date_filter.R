#' @title Generate Date Filter
#'
#' @description Generate date filter given inputted start/end dates
#'
#' @param start_date start date for the period of analysis
#' @param end_date end date for the period of analysis
#'


generate_date_filter <- function(start_date, end_date){

  sprintf("(date_name between '%s' and '%s')", start_date, end_date)

}

