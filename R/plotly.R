##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @title 
##' @param p 
##' @param path 
##' @return 
##' @author WTFRR04881L
##' @export
dump_plot <- function(p, path) {
  cur <- getwd()
  tryCatch({
    setwd(dirname(path))
    htmlwidgets::saveWidget(plotly::as_widget(p),
                            file=basename(path))
  },
  finally = {setwd(cur)}
  )
}
