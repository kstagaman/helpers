#' @name replace.dt.NAs
#' @title replace all NAs in a data.table
#' @description Replaces all NAs in an object of class data.table with 0 (or another replacement)
#' @param dt a data.table
#' @param replacement an integer, number, or character. Default 0
#' @seealso \code{\link{data.matrix}}, \code{\link{data.table::data.table}}
#' @export
#' @examples
#' require(data.table)
#' DT <- data.table(X = c(1:6, NA, 8:10), Y = letters[1:10])
#' DT.noNA <- replace.dt.NAs(DT)
#' DT
#' DT.noNA

replace.dt.NAs <- function(dt, replacement = 0){
  sort.col <- attributes(dt)$sorted
  if (!is.null(sort.col)) {
    old.values <- dt[[sort.col]]
  } else {
    old.values <- dt[[1]]
  }
  dm <- data.matrix(dt)
  dm[is.na(dm)] <- replacement
  dt.return <- data.table(dm)
  if (!is.null(sort.col)) {
    dt.return[[sort.col]] <- old.values
    setkeyv(dt.return, sort.col)
  } else {
    dt.return[[1]] <- old.values
  }
  return(dt.return)
}
