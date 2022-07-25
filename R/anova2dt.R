#' @name anova2dt
#' @title ANOVA results table to `data.table`
#' @description Make a nice looking `data.table` from a results table from `anova`. This function requires the packages 'data.table' and 'stringr' to be installed, and does __not__ work with results from `summary`.
#' @param tbl anova or data.frame; a table with results from `anova`.
#' @param sig.thresh numeric; threshold for marking p-values as significant. Default is 0.05.
#' @seealso \code{\link{anova}}, \code{\link{as.data.table}}
#' @export
#' @examples
#' df <- data.frame(X = c(rnorm(50), {rnorm(50) - 0.8}), Y = c(rep("A", 50), rep("B", 50)))
#' res <- anova(aov(X ~ Y, data = df))
#' anova2dt(res)

anova2dt <- function(tbl, sig.thresh = 0.05) {
  require(data.table)
  require(stringr)
  dt <- as.data.table(tbl, keep.rownames = "Term")
  p.col <- str_which(names(dt), "Pr|p\\.val|p_val")
  names(dt)[p.col] <- "P.value"
  names(dt) <- str_to_title(names(dt))
  dt[, Sig := ifelse(P.value <= sig.thresh, "*", "")]
  return(copy(dt))
}
