# Helpers

An R package with various, simple functions for making life easier.

## Installation

```
devtools::install_github("kstagaman/helpers")
```

## Current Functions

- `as.obj`: Treat a string as an object name
- `cat.n`: Automatically set the `sep` argument in `cat` to a newline
- `chance.to.happen`: Calculate the probability of an outcome happening given its per-event probability and the number of events
- `getCB.pal`: Select from two colorblind-friendly palettes (8 colors each) with either gray or black as the first color
- `display.html.table`: Embeds a HTML table (from an HTML file) in an iframe within the output document to preserve nice formatting
- `get.divisors`: Get the divisors of an integer
- `min2time`: Convert minutes in decimal form to (years), days, hours, minutes, and seconds
- `prev.tbl`: Previews the first n rows and columns from an array, matrix, data.frame...etc. Like `head` but also limits the columns shown, not just the rows.
- `replace.dt.NAs`: Replaces all NAs in an object of class data.table with 0 (or another replacement)
- `right.triangle`: Given the lenghts of two sides of a right triangle, returns the third (via the Pythagorean theorem)
- `sec2time`: Convert seconds in decimal form to (years), days, hours, minutes, and seconds
- `unavailable.packages`: Finds packages loaded (via `library` or `require`) by a script and determines which ones are not installed. Installs missing packages by default.
- `write.installed.packages`: Lists and writes all installed packages to a file.

## Notes

The function `unavailable_packages` has the option to install missing packages [bioconductor's](https://www.bioconductor.org/) `BiocManager::install`. To utilize, you can install with `install.packages("BiocManager")`.

The function `replace.dt.NAs` is only for use with table created with the `data.table` [package](https://github.com/Rdatatable/data.table).

The function `display.html.table` was developed particularly for use in embedding html tables in html documents using knitr and Rmarkdown files. It may have uses in other cases, but it hasn't been tested for those. It will not work for github_documents in a github markdown file.
