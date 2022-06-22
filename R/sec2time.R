#' @name sec2time
#' @title convert decimal seconds to long form
#' @description Convert seconds in decimal form to (years), days, hours, minutes, and seconds
#' @param s numeric; seconds in decimal form
#' @param include.year logical; whether to include years in the output (TRUE), or just days, hours, minutes, and seconds (FALSE)
#' @export
#' @examples
#' sec2time(5027.32)

sec2time <- function(s, include.year = FALSE) {
  if (grepl('.', s, fixed = TRUE)) {
    decimals <- nchar(strsplit(as.character(s), '.', fixed=T)[[1]][2])
  } else {
    decimals <- 0
  }

  if(!include.year) {
    day <- s / (60 * 60 * 24)
    if (abs(round(day) - day) < 1e-12) { day <- round(day) }
    hrs <- (day - floor(day)) * 24
    if (abs(round(hrs) - hrs) < 1e-12) { hrs <- round(hrs) }
    min <- (hrs - floor(hrs))*60
    if (abs(round(min) - min) < 1e-12) { min <- round(min) }
    sec <- round((min - floor(min)) * 60, decimals)

    return(
      paste0(
        floor(day), "d:",
        floor(hrs), "h:",
        floor(min), "m:",
        sec, "s"
      )
    )
  } else {
    year <- s / (60 * 60 * 24 * 365.25)
    day <- (year - floor(year)) * 365.25
    if (abs(round(day) - day) < 1e-12) { day <- round(day) }
    hrs <- (day - floor(day)) * 24
    if (abs(round(hrs) - hrs) < 1e-12) { hrs <- round(hrs) }
    min <- (hrs - floor(hrs)) * 60
    if (abs(round(min) - min) < 1e-12) { min <- round(min) }
    sec <- round((min - floor(min)) * 60, decimals)

    return(
      paste0(
        floor(year), "y:",
        floor(day), "d:",
        floor(hrs), "h:",
        floor(min), "m:",
        sec, "s"
      )
    )
  }
}
