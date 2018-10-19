##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @title 
##' @param s_df 
##' @param s_p 
##' @param ts_df 
##' @param ts_pl 
##' @return 
##' @author cayek
##' @export
shiny_ts_features <- function(s_df, s_p, ts_df, ts_pl) {
  library(plotly)
  library(shiny)

  ui <- fluidPage(
      ## verbatimTextOutput("selection"), ## to debug
      plotlyOutput("s_p"),
      plotlyOutput("ts_p")
  )

  server <- function(input, output, session) {
    idd <- ts_df$id[1]
    output$s_p <- renderPlotly({
      s_p
    })

    output$selection <- renderPrint({
      s <- event_data("plotly_click")
      if (length(s) == 0) {
        "Click on a cell in the heatmap to display a scatterplot"
      } else {
        idd <<- s_df$id[which.min(abs(s_df$y - s$y))]
        cat(glue("Selected id: {idd}"))
      }
    })

    output$ts_p <- renderPlotly({
      s <- event_data("plotly_click")
      ts_df %>%
        filter(id == idd) %>%
        ts_pf()
    })
  }

  shinyApp(ui, server)
}
