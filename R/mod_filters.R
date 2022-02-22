#' filters UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_filters_ui <- function(id) {
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
      choices = NULL
    ),
    selectInput(
      ns("metric"),
      "Metric:",
      choices = NULL
    ),
    sliderInput(
      ns("threshold"),
      "Threshold:",
      min = 0,
      max = 120,
      value = 30,
      step = 5
    ),
    actionButton(
      ns("render_report"),
      "Render report"
    )
  )
}

#' filters Server Functions
#' @importFrom gargoyle trigger
#' @noRd
mod_filters_server <- function(id, r6) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    updateSelectInput(
      inputId = "carrier",
      choices = r6$unique_carriers$name
    )

    updateSelectInput(
      inputId = "month",
      choices = r6$months
    )

    updateSelectInput(
      inputId = "metric",
      choices = r6$metrics
    )


    observeEvent(
      c(
        input$carrier,
        input$month,
        input$metric,
        input$threshold
      ),
      {
        trigger("changed_filters")
      }
    )

    observeEvent(input$render_report, {
      r6$generate_results(
        carrier_filter = input$carrier,
        month_filter = as.numeric(input$month),
        metric_filter = input$metric,
        threshold = input$threshold
      )

      trigger("render_report")
    })
  })
}

## To be copied in the UI
# mod_filters_ui("filters_1")

## To be copied in the server
# mod_filters_server("filters_1", r6)
