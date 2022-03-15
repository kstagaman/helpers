#' write installed packages to file
#'
#' Lists and writes all installed packages to a file.
#' @param name character; the name of the output file, NO EXTENSION. Default "installed_packages"
#' @param path character; the name of the output directory. Default "./"
#' @param filetype character; the type of file to write "txt" for a plaintext file or "rds" for an R binary object file. Default "txt"
#' @param include.date logical; whether to include the current date in the output file name. Default TRUE
#' @seealso \code{\link{installed.packages}}, \code{\link{saveRDS}}, \code{\link{writeLines}}
#' @export
#' @examples
#' write.installed.packages()

write.installed.packages <- function(
  name = "installed_packages",
  path = "./",
  filetype = c("txt", "rds"),
  include.date = TRUE
) {
  filetype <- tolower(filetype)
  if (!(filetype %in% c("txt", "rds"))) {
    stop("Argument `filetype` needs to be one of 'txt' or 'rds'")
  }
  if (!dir.exists(path)) {
    dir.create(path, recursive = TRUE)
  }
  if (include.date) {
    outfile <- file.path(path, paste0(name, "_", Sys.Date(), ".", filetype))
  } else {
    outfile <- file.path(path, paste0(name, ".", filetype))
  }
  pkgs <- row.names(installed.packages())
  if (filetype == "rds") {
    saveRDS(pkgs, file = outfile)
  } else {
    writeLines(pkgs, con = outfile, sep = "\n")
  }
}
