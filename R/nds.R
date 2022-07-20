#' @name nds
#' @title roll n dice of side s
#' @description Roll some dice!
#' @param n integer; number of dice to roll.
#' @param s integer; number of sided die to roll.
#' @param sum logical; if TRUE, return the sum of the results, if false, return a vector of results equal in length to `n`. Default is TRUE.
#' @seealso \code{\link{sample}}
#' @export
#' @examples
#' # Roll 4d6!
#' nds(n = 4, s = 6)

nds <- function(n = 1, s = 4, sum = TRUE) {
  if (!is.integer(as.integer(n))) {
    stop("Argument `n' must be coercible into an integer")
  }
  if (!is.integer(as.integer(s))) {
    stop("Argument `s' must be coercible into an integer")
  }
  if (n <= 0) { stop("Argument `n' must be greater than 0") }
  if (s <= 0) { stop("Argument `s' must be greater than 0") }
  if (!is.logical(sum)) { stop("Argument `sum' must be TRUE/FALSE") }

  rolls <- sample(x = 1:s, size = n, replace = TRUE)
  if (sum) {
    return(sum(rolls))
  } else {
    return(rolls)
  }
}
