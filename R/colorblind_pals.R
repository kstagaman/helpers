#' colorblind palettes
#'
#' Select from two colorblind-friendly palettes (8 colors each) with either gray or black as the first color
#' @param pal string or integer; choose either the `"grey"` or `"black"` palette. Can also be `"g"`, `"b"`, `"1"`, or `"2"`, respectively
#' @export
#' @examples
#' color.pal <- getCB.pal("black")

# Color blind palettes
getCB.pal <- function(pal = c("grey", "black")) {
  if (!(pal %in% c("grey", "black", "g", "b", 1, 2))) {
    stop("Argument `pal` must be 'gray', 'black', 'g', 'b', 1, or 2")
  }
  if(pal == "gray" | pal == "grey" | pal == "g" | pal == 1) {
    cb.pal <- c(
      "#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7"
    )
    names(cb.pal) <- c("gray", "orange", "sky_blue", "green", "yellow", "blue", "red", "pink")
  } else if(pal == "black" | pal == "b" | pal == 2) {
    cb.pal <- c(
      "#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7"
    )
    names(cb.pal) <- c("black", "orange", "sky_blue", "green", "yellow", "blue", "red", "pink")
  }
  return(cb.pal)
}
