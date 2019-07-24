message("Install some R packages")
list.of.packages <- c("ggplot2",
                      "tidyverse",
                      "Rcpp",
                      "here",
                      "data.table",
                      "dplyr",
                      "devtools")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
