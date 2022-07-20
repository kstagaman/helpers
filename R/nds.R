#' @name "%d%"
#' @title roll n dice of side s
#' @description Roll some dice!
#' @param n integer; number of dice to roll
#' @param s integer; number of sided die to roll
#' @seealso \code{\link{sample}}
#' @export
#' @examples
#' # Roll 4d6!
#' 4%d%6

"%d%" <- function(n, s) {
  if (!is.integer(as.integer(n))) {
    stop("Argument `n' must be coercible into an integer")
  }
  if (!is.integer(as.integer(s))) {
    stop("Argument `s' must be coercible into an integer")
  }
  if (n <= 0) { stop("Argument `n' must be greater than 0") }
  if (s <= 0) { stop("Argument `s' must be greater than 0") }
  rolls <- sample(1:s, n, replace = T)
  cat(paste(c("Rolls:", rolls), collapse = " "), sep = "\n")
  return(sum(rolls))
}
