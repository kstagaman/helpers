#' @name right.triangle
#' @title right triangle
#' @description Given the lenghts of two sides of a right triangle, returns the third (via the Pythagorean theorem)
#' @param a numeric; length of side A
#' @param b numeric; length of side B
#' @param c numeric; length of side C, the hypotenuse
#' @param round.to integer; the number of decimals to round the printed output to
#' @param value logical; TRUE: return the value, FALSE: just print the value
#' @export
#' @examples
#' right.triangle(a = 2, b = 3)

right.triangle <- function(a = NULL, b = NULL, c = NULL, round.to = 3, value = FALSE) {
  if (sum(c(is.null(a), is.null(b), is.null(c))) != 1) {
    stop("Must supply lengths of exactly two sides")
  }
  # a^2 + b^2 = c^2
  # a^2 = c^2 - b^2
  if (is.null(a)) {
    res <- sqrt(c^2 - b^2)
    res.txt <- "a ="
  } else if (is.null(b)) {
    res <- sqrt(c^2 - a^2)
    res.txt <- "b ="
  } else if (is.null(c)) {
    res <- sqrt(a^2 + b^2)
    res.txt <- "c ="
  }
  cat(paste(res.txt, round(res, round.to)), sep = "\n")
  if (value) { return(res) }
}

