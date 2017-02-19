#' @title Easy load operator for packages
#' @description load_pkg Loads a list of packages. If a package requires installation, the function will install it from CRAN.
#' @param packagelist Vector of packages to load into R
#' @examples load_pkg(c("ggplot2", "dplyr"))
#' @return Packages loaded into R
#' @export


load_pkg <- function(packagelist) {
  
    # Check if any package needs installation:
  PackagesNeedingInstall <- packagelist[!(packagelist %in% installed.packages()[,"Package"])]
  if(length(PackagesNeedingInstall))
  {
    cat("\nInstalling necesarry packages: ", paste0(PackagesNeedingInstall,collapse = ", "), "\n")
    install.packages(PackagesNeedingInstall, dependencies = T)
  }
  # load packages into R:
  x <- 
  suppressPackageStartupMessages(lapply(packagelist, require, character.only = TRUE, quietly = T))
  
}