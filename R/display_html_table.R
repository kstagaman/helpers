#' display HTML table in an Rmarkdown document
#'
#' Embeds a HTML table (from an HTML file) in an iframe within the output document to preserve nice formatting
#' @param file character; an HTML file
#' @param width integer; width of the iframe, in pixels; default 800
#' @param height integer; height of the iframe, in pixels; default 400
#' @seealso \code{\link{readLines}}, \code{\link{URLencode}}
#' @export
#' @examples
#' mat <- matrix(rnorm(1:50), nrow = 5, ncol = 10)
#' flextable::save_as_html(flextable::flextable(as.data.frame(mat)), path = "example_table.html")
#' display.html.table("example_table.html")

display.html.table <- function(file, width = 800, height = 400) {
  cat(
    paste0(
      '<iframe src="data:text/html;charset=utf-8,',
      URLencode(paste(readLines(file), collapse="\n")),
      '" style="border: none; seamless:seamless; width: ',
      width,
      'px; height: ',
      height,
      'px"></iframe>'
    )
  )
}
