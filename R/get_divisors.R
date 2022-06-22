#' @name get.divisors
#' @title get divisors
#' @description Get the divisors of an integer
#' @param x integer
#' @export
#' @examples
#' color.pal <- getCB.pal("black")

get.divisors <- function(x) {
  if (as.integer(x) != x) { stop("Argument `x` must be an integer") }
  divisors <- 1
  for (div in 2:x) {
    if (x %% div == 0) {
      divisors <- c(divisors, div)
    }
  }
  return(divisors)
}
