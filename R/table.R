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
  ## TODO not working with the print inside the function
  library("ascii")
  ascii(df, header=TRUE, colnames=colnames(df), rownames=rownames(df))
  ## print(ascii(df, header=TRUE, colnames=colnames(df), rownames=rownames(df)),
  ##       type="org")

}
