#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {

  business_logic <- BusinessLogic$new()

  mod_filters_server("filters_1", business_logic)
}
