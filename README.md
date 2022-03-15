# Helpers

An R package with various, simple functions for making life easier.

Installation:

```
devtools::install_github("kstagaman/helpers")
```

The function `unavaiable_packages()` has the option to install missing packages with `BiocManager::install()`. To utilize, you can install with `install.packages("BiocManager")`.

Current functions:

- as.obj: Treat a string as an object name
- cat.n: Automatically set the `sep` argument in `cat` to `"\n"`
- chance.to.happen: Calculate the probability of an outcome happening given its per-event probability and the number of events
- getCB.pal: Select from two colorblind-friendly palettes (8 colors each) with either gray or black as the first color
- get.divisors: Get the divisors of an integer
- min2time: Convert minutes in decimal form to (years), days, hours, minutes, and seconds
- prev.tbl: Previews the first n rows and columns from an array, matrix, data.frame...etc. Like `head` but also limits the columns shown, not just the rows.
- right.triangle: Given the lenghts of two sides of a right triangle, returns the third (via the Pythagorean theorem)
- sec2time: Convert seconds in decimal form to (years), days, hours, minutes, and seconds
- unavailable.packages: Finds packages loaded (via `library` or `require`) by a script and determines which ones are not installed. Installs missing packages by default.
- write.installed.packages: Lists and writes all installed packages to a file.
