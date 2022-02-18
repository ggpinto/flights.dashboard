#' filters UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom gargoyle trigger
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
      choices = month.name
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
#'
#' @noRd
mod_filters_server <- function(id, r6) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    updateSelectInput(
      inputId = "carrier",
      choices = r6$unique_carriers$name
    )

    updateSelectInput(
      inputId = "metric",
      choices = r6$metrics
    )


    observeEvent(
      c(input$carrier, input$month, input$metric, input$threshold),
      {
        trigger("changed_filters")
      }
    )

    observeEvent(input$render_report, {

      # print(input$metric)

      r6$generate_results(
        carrier_filter = r6$unique_carriers %>%
          dplyr::filter(name == input$carrier) %>%
          dplyr::pull(carrier),
        month_filter = r6$months %>%
          dplyr::filter(month_name == input$month) %>%
          dplyr::pull(month_number),
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
# mod_filters_server("filters_1")
