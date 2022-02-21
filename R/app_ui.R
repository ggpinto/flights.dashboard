#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`, do not remove!
#' @import shiny shinydashboard
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    dashboardPage(
      dashboardHeader(title = "flights.dashboard"),
      dashboardSidebar(
        mod_filters_ui("filters_1")
      ),
      dashboardBody(
        mod_results_ui("results_1")
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "flights.dashboard"
    )
  )

  shinyjs::useShinyjs()
}
