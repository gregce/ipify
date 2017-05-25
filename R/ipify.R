#' Get a response object from ipify
#'
#' This is a private, non-exported function
#'
#' @name get_ip_response
#' @param url The base url of the ipify service.
#' @param ... parameter = Format. What you  want the service to return. Valid options = c("text", "json", "jsonp")
#' @importFrom methods hasArg

get_ip_response <- function(url = ipify.env$API_URL, ...) {
  args <- list(...)
  if (hasArg(format)) {
    if (args$format %in% c("text","json","jsonp")) {
    url <- paste0(url,"?format=",args$format, sep="")
    } else
      message(paste0(args$format, " is not a recognized return format, defaulting to text"))
  }
  return(httr::GET(url = url, httr::add_headers("user-agent" = ipify.env$USER_AGENT)))
}

#' Get IP
#'
#' Query the ipify service (https://www.ipify.org) to retrieve this machine's
#' public IP address.
#'
#' @name get_ip
#' @param max_tries The number of times to retry the ipify service on failure. Defaults to 3.
#' @param ... parameter = Format. What you  want the service to return. Valid options = c("text", "json", "jsonp")
#' @export
#' @return The public IP address of this machine as a plain text string,

get_ip <- function(max_tries = ipify.env$MAX_TRIES, ...) {
  for(i in 1:max_tries){
    tryCatch({
      resp <- get_ip_response(...)
      break
    },  error=function(cond) message(paste0("Error accessing the ipify service", cond))
    )
  }
  if (resp$status_code!=200) stop(paste0("Received an invalid status code from ipify: ", resp$status_code))
  if (grepl("jsonp", resp$request$url))  return(httr::content(resp, type = "text")) else return(httr::content(resp))
}

