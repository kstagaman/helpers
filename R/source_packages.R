#' @name source.packages
#' @title check if all packages have been loaded, and if not, source the input file
#' @description For use with a script specifically for loading all necessary packages. This functions checks the session info to see if all packages have been loaded. If not, it sources the file.
#' @param file character; path and name of a file that load packages with `library` or `require`
#' @seealso \code{\link{sessionInfo}}
#' @export

source.packages <- function(file) {
  pkgs <- gsub(
    "library|require|\\(|\\)", "",
    grep("^library|^require", readLines(file), value = T)
  )
  if (!all(pkgs %in% names(sessionInfo()$otherPkgs))) {
    suppressWarnings(source(file))
  }
}
