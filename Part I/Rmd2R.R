# Extract R codes from Rmd file
library(knitr)
getwd()
purl("/Users/Martin/Desktop/Dropbox/Github/Econometric Analysis/Part I/Part_I.Rmd",
     out="/Users/Martin/Desktop/Dropbox/Github/Econometric Analysis/Part I/Part_I.R")
