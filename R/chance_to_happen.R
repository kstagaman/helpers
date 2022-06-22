#' @name chance.to.happen
#' @title chance to happen
#' @description Calculate the probability of an outcome happening given its per-event probability and the number of events
#' @param prob numeric; the probability (as a fraction or decimal) of the outcome occurring in a single event
#' @param events integer; the number of events
#' @param round.to integer; the number of decimal places to round the output to
#' @param value logical; if TRUE, return the value of the calculated chance or, if FALSE, print the results
#' @export
#' @examples
#' # Chance to flip 10 heads in a row
#' chance.to.happen(prob = 0.5, events = 10)

chance.to.happen <- function(prob, events, round.to = 3, value = FALSE) {
  if (prob < 0 | prob > 1) { stop("Argument `prob` must be between 0 and 1 (inclusive)") }
  if (as.integer(events) != events) { stop("Argument `events` must be an integer") }
  if (as.integer(round.to) != round.to) { stop("Argument `round.to` must be an integer") }
  if (!is.logical(value) & value != 0 & value != 1) { stop("Argument `value` must be logical") }
  chance <- 1 - (1 - prob) ^ events
  if (value) {
    return(chance)
  } else {
    cat(paste0("\t", round(chance * 100, round.to), "%"), sep = "\n")
  }
}
