#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @importFrom gargoyle init
#' @noRd
app_server <- function(input, output, session) {
  business_logic <- BusinessLogic$new()

  init("render_report", "changed_filters")

  mod_filters_server("filters_1", business_logic)
  mod_results_server("results_1", business_logic)
}
