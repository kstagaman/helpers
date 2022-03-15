#' string as an object name
#'
#' Treat a string as an object name
#' @param x a string or object containing a string
#' @seealso \code{\link{eval}}, \code{\link{parse}}
#' @export
#' @examples
#' a <- 1
#' b <- "a"
#' as.obj(b)

as.obj <- function(x) {
    if (!("character" %in% class(x))) { stop("Argument `x` must be a string") }
    return(eval(parse(text=x)))
}
