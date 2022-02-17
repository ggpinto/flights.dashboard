#' filters UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_filters_ui <- function(id){
  ns <- NS(id)
  tagList(
    selectInput(
      ns("carrier"),
      "Carrier:",
      choices = NULL
    ),
    selectInput(
      ns("month"),
      "Month:",
      choices = month.name
    ),
    selectInput(
      ns("metric"),
      "Metric:",
      choices = NULL
    ),
    actionButton(
      ns("render_report"),
      "Render report"
    )
  )
}

#' filters Server Functions
#'
#' @noRd
mod_filters_server <- function(id, r6){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    updateSelectInput(
      inputId = "carrier",
      choices = r6$unique_carriers$name
    )
    updateSelectInput(
      inputId = "metric",
      choices = r6$metrics
    )
  })
}

## To be copied in the UI
# mod_filters_ui("filters_1")

## To be copied in the server
# mod_filters_server("filters_1")
