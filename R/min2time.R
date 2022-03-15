#' convert decimal minutes to long form
#'
#' Convert minutes in decimal form to (years), days, hours, minutes, and seconds
#' @param m numeric; minutes in decimal form
#' @param include.year logical; whether to include years in the output (TRUE), or just days, hours, minutes, and seconds (FALSE)
#' @export
#' @examples
#' min2time(527.86)

min2time <- function(m, include.year = FALSE) {
  if (!include.year) {
    day <- m / (60 * 24)
    if (abs(round(day) - day) < 1e-12) { day <- round(day) }
    hrs <- (day - floor(day)) * 24
    if (abs(round(hrs) - hrs) < 1e-12) { hrs <- round(hrs) }
    min <- (hrs - floor(hrs)) * 60
    if (abs(round(min) - min) < 1e-12) { min <- round(min) }
    sec <- round((min - floor(min)) * 60, 1)

    return(
      paste0(
        floor(day), "d:",
        floor(hrs), "h:",
        floor(min), "m:",
        sec, "s"
      )
    )
  } else {
    year <- m / (60 * 24 * 365.25)
    day <- (year - floor(year)) * 365.25
    if (abs(round(day) - day) < 1e-12) { day <- round(day) }
    hrs <- (day - floor(day)) * 24
    if (abs(round(hrs) - hrs) < 1e-12) { hrs <- round(hrs) }
    min <- (hrs - floor(hrs)) * 60
    if (abs(round(min) - min) < 1e-12) { min <- round(min) }
    sec <- round((min - floor(min)) * 60, 1)

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
