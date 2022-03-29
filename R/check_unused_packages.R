#' check for unused pacak
#'
#' Automatically set the `sep` argument in `cat` to a newline
#' @param x a string or object containing a string
#' @seealso \code{\link{cat}}
#' @export
#' @examples
#' string <- "hello world!"
#' cat(string)
#' cat.n(string)

check.unused.packages <- function(files, value = FALSE) {
  my.pkgs <- c("stringr", "magrittr", "data.table")
  for (pkg in my.pkgs) { require(pkg, character.only = T) }
  base.pkgs <- c(
    "stats",
    "graphics",
    "grDevices",
    "utils",
    "datasets",
    "methods",
    "base",
    "tools",
    "knitr"
  )
  cant.detach <- c(base.pkgs, my.pkgs)

  listed.packages <- c(
    sapply(files, function(file) {
      readLines(file) %>%
        str_subset("^ *#", negate = TRUE) %>%
        str_subset("require|library") %>%
        str_remove_all("require\\(|library\\(|\\)| ")
    }) %>%
      unname() %>%
      unlist() %>%
      unique(),
    base.pkgs
  ) %>%
    unique() %>%
    sort()

  package.functions <- lapply(listed.packages, function(pkg) {
    # cat(pkg, sep = "\n")
    library(
      pkg,
      character.only = TRUE,
      quietly = TRUE,
      verbose = FALSE,
      warn.conflicts = FALSE,
      attach.required = FALSE
    )
    pkg.dt <- data.table(
      Package = pkg,
      Function = ls(paste0("package:", pkg))
    )
    if (!(pkg %in% cant.detach)) {
      detach(paste0("package:", pkg), character.only = T, unload = T, force = T) %>%
        suppressWarnings()
    }
    return(pkg.dt)
  }) %>% rbindlist()

  called.functions <- sapply(files, function(file) {
    readLines(file) %>%
      str_subset("^ *#|library|require", negate = TRUE) %>%
      str_subset("[\\w\\.]+\\(") %>%
      str_extract("[\\w\\.]+\\(") %>%
      str_remove("\\(")
  }) %>%
    unname() %>%
    unlist() %>%
    unique()
  used.packages <- unique(package.functions[Function %in% called.functions]$Package)
  unused.packages <- listed.packages[!(listed.packages %in% c(used.packages, base.pkgs))]
  cat(
    paste0(
      "The following packages are loaded in the provided files,\n",
      "but appear to not have any functions called from them:\n\t",
      paste(unused.packages, collapse = "\n\t"),
      "\nThese packages are either not being utilized,\n",
      "or are primarily used to load other packages (e.g. tidyverse)"
    ),
    sep = "\n"
  )
  # cat(paste(listed.packages, collapse = "\n"), sep = "\n")
  if (value) { return(unused.packages) }
}
