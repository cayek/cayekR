##' .. content for \description{} (no empty lines) ..
##'
##' .. content for \details{} ..
##' @title 
##' @param df 
##' @param ... 
##' @return 
##' @author cayek
##' @export
print_table <- function(df, ...) {
  ascii::ascii(df, colnames=colnames(df),
               rownames=rownames(df),
               include.rownames = FALSE,
               ...)
}
