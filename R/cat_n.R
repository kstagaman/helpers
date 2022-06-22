#' @name cat.n
#' @title newline cat
#' @description Automatically set the `sep` argument in `cat` to a newline
#' @param x a string or object containing a string
#' @seealso \code{\link{cat}}
#' @export
#' @examples
#' string <- "hello world!"
#' cat(string)
#' cat.n(string)

cat.n <- function(x) { cat(x, sep = "\n") }
