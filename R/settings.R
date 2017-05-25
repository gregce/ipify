#' Function to get the users OS for setting the user agent
#'
#' This is a private, non-exported function
#'
#' @name get_os
#'
get_os <- function(){
  sysinf <- Sys.info()
  if (!is.null(sysinf)){
    os <- sysinf['sysname']
    if (os == 'Darwin')
      os <- "osx"
  } else { ## mystery machine
    os <- .Platform$OS.type
    if (grepl("^darwin", R.version$os))
      os <- "OS_X"
    if (grepl("linux-gnu", R.version$os))
      os <- "linux"
    ## add check for Windows
  }
  tolower(os)
}


#' Set up the environment used to store setting information
ipify.env <-new.env(parent = emptyenv())

ipify.env$API_URL <- "https://api.ipify.org"

ipify.env$MAX_TRIES <- 3

ipify.env$USER_AGENT <- sprintf("r-ipify/%s rlang/%s %s", version$nickname, version$minor, get_os())
