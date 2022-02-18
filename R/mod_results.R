#' results UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom gargoyle watch on
mod_results_ui <- function(id) {
  ns <- NS(id)
  tagList(
    textOutput(
      ns("text_1"),
      container = h2
    ),
    textOutput(
      ns("text_2"),
      container = p
    ),
    plotOutput(
      ns("plot")
    )
  )
}

#' results Server Functions
#'
#' @noRd
mod_results_server <- function(id, r6) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    output$text_1 <- renderText(
      'When you are done with filtering click on "Render report"'
    )

    c("text_2", "plot") %>%
      purrr::map(shinyjs::hide)

    on("changed_filters", {
      output$text_1 <- renderText(
        'When you are done with filtering click on "Render report"'
      )

      c("text_2", "plot") %>%
        purrr::map(shinyjs::hide)
    })

    on("render_report", {
      output$text_1 <- renderText(
        r6$results$title
      )
      output$text_2 <- renderText(
        r6$results$text
      )
      output$plot <- renderPlot(
        {
          r6$results$chart
        },
        res = 96
      )
      c("text_2", "plot") %>%
        purrr::map(shinyjs::show)
    })
  })
}

## To be copied in the UI
# mod_results_ui("results_1")

## To be copied in the server
# mod_results_server("results_1, r6")
