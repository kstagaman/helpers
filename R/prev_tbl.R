#' preview table
#'
#' Previews the first n rows and columns from an array, matrix, data.frame...etc. Like `head` but also limits the columns shown, not just the rows.
#' @param tbl an array, matrix, data.frame, data.table, tibble, etc
#' @param n integer; the number of rows and columns you want to preview, default 6
#' @seealso \code{\link{head}}
#' @export
#' @examples
#' mat <- matrix(rnorm(1:10000), nrow = 100, ncol = 100)
#' prev.tbl(mat)

prev.tbl <- function(tbl, n = 6) {
  n.col <- min(c(n, ncol(tbl)))
  n.row <- min(c(n, nrow(tbl)))
  print(tbl[1:n.row, 1:n.col])
}
