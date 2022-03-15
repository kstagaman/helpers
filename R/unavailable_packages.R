#' list (and install) unavailable packages
#'
#' Finds packages loaded (via `library` or `require`) by a script and determines which ones are not installed. Installs missing packages by default.
#' @param file character; the name of a file that loads packages
#' @param auto.install logical; TRUE: will attempt to install all missing packages, FALSE: will ask whether to install all, one, or no missing packages. default TRUE
#' @param use.bioconductor logical; TRUE: use `bioconductor` (i.e., function `BiocManager::install`) to install the missing packages, FALSE: use base `install.packages` function. default TRUE
#' @seealso \code{\link{BiocManager::install}}, \code{\link{install.packages}}
#' @export


unavailable.packages <- function(file, auto.install = TRUE, use.bioconductor = TRUE) {
  pkg.pattern <- "library\\(|require\\("
  rm.pattern <- paste0(pkg.pattern, "|\\)")
  no.comments <- grep("^ *#", readLines(con = file), invert = T, value = T)
  packages <- gsub(rm.pattern, "", grep(pkg.pattern, no.comments, value = T))
  missing.packages <- packages[!(packages %in% row.names(installed.packages()))]
  if (length(missing.packages) == 0) {
    cat("All packages are available.", sep = "\n")
  } else {
    auto.install.message <- paste0(
      "The following packages will be installed with ",
      ifelse(use.bioconductor, "BiocManager::install() ", "install.packages() "),
      ":\n\t",
      paste(missing.packages, collapse = "\n\t")
    )
    choices <- c(
      "1: All",
      "2: None",
      sapply(1:length(missing.packages), function(i) {paste0(i + 2, ": ", missing.packages[i]) })
      )
    ask.install.message <- paste0(
      "There are missing packages, what would you like to install?\n\t",
      paste(choices, collapse = "\n\t")
    )

    if (auto.install) {
      cat(auto.install.message, sep = "\n")
      for (package in missing.packages) {
        if (use.bioconductor) {
          BiocManager::install(package)
        } else {
          install.packages(package)
        }
      }
    } else {
      cat(ask.install.message, sep = "\n")
      choice <- as.numeric(readline(prompt = "Choice: "))
      if (choice == 1) {
        for (package in missing.packages) {
          if (use.bioconductor) {
            BiocManager::install(package)
          } else {
            install.packages(package)
          }
        }
      } else if (choice != 2) {
        if (use.bioconductor) {
          BiocManager::install(missing.packages[choice - 2])
        } else {
          install.packages(missing.packages[choice - 2])
        }
      }
    }
  }
}
