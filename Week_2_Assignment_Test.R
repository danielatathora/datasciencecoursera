# Coursera R Programming Week Assignment

# setwd("~/Documents/Coursera_Data_Science/Course_2_R_Programming/Week_2")
# getwd()

print(R.version.string)
# Example: ## [1] "R version 3.4.0 (2017-04-21)"
# Actual : ## [1] "R version 4.0.2 (2020-06-22)"

source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10)
# Example: ## [1] 4.064128
# Actual:  ## [1] 4.064128

pollutantmean("specdata", "nitrate", 70:72)
# Example: ## [1] 1.706047
# Actual:  ## [1] 1.706047

pollutantmean("specdata", "nitrate", 23)
# Example: ## [1] 1.280833
# Actual:  ## [1] 1.280833




## COMPLETE TEST
source("complete.R")

complete("specdata", 1)

## Example
##   id nobs
## 1  1  117

## Actual
##   id nobs
## 1  1  117

complete("specdata", c(2, 4, 8, 10, 12))

## Example
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96

## Actual
##   id nobs
## 1  2 1041
## 2  4  474
## 3  8  192
## 4 10  148
## 5 12   96


complete("specdata", 30:25)

## Examaple
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463

## Actual
##   id nobs
## 1 30  932
## 2 29  711
## 3 28  475
## 4 27  338
## 5 26  586
## 6 25  463


complete("specdata", 3)

## Example
##   id nobs
## 1  3  243

## Actual
#   id nobs
# 1  3  243

