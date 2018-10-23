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
shiny_ts_features <- function(s_df, s_pf, ts_df, ts_pf) {
  library(plotly)
  library(shiny)

  ## TODO: do not work without the debug lines :o


  ui <- fluidPage(
    ## verbatimTextOutput("selection"), ## to debug
    plotlyOutput("s_p"),
    plotlyOutput("ts_p")
  )

  s_p <- s_df %>%
    s_pf()

  server <- function(input, output, session) {
    output$s_p <- renderPlotly({
      s_p
    })

    ## output$selection <- renderPrint({
    ##   s <- event_data("plotly_click", source="s_pf")
    ##   if (length(s) == 0) {
    ##     "Click on a cell in the heatmap to display a scatterplot"
    ##   } else {
    ##     idd <- s_df$id[which.min(abs(s_df$y - s$y))]
    ##     cat(glue("Selected id: {idd}")) ## to debug
    ##   }
    ## })

    output$ts_p <- renderPlotly({
      s <- event_data("plotly_click", source = "s_pf")
      if (length(s) == 0) {
        idd <- ts_df$id[1]
      } else {
        idd <- s_df$id[which.min(abs(s_df$y - s$y))]
      }
      ts_df %>%
        filter(id == idd) %>%
        ts_pf()
    })
  }

  shinyApp(ui, server)
}
