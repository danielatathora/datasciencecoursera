# corr_test.R - Test corr.R 
# Coursera R Programming Week 2 Assignment 3

setwd("~/Documents/Coursera_Data_Science/Course_2_R_Programming/Week_2")
getwd()

print(R.version.string)
# Example: ## [1] "R version 3.4.0 (2017-04-21)"
# Actual : ## [1] "R version 4.0.2 (2020-06-22)"

source("corr.R")

cr <- corr("specdata", 150)
head(cr)

## Example
## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814

## Actual
## [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814

summary(cr)
## Example
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313

## Actual
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313 

cr <- corr("specdata", 400)
head(cr)
## Example
## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860

## Actual
## [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860


summary(cr)
## Example
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313

## Actual
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313 

cr <- corr("specdata", 5000)
summary(cr)
## Example
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
## 
## Actual
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 

length(cr)
## Example
## [1] 0

## Actual
#  [1] 0

cr <- corr("specdata")
summary(cr)
## Example
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -1.00000 -0.05282  0.10718  0.13684  0.27831  1.00000

## Actual
##      Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
## -1.00000 -0.05282  0.10718  0.13684  0.27831  1.00000 

length(cr)
## Example
## [1] 323

## Actual
## [1] 323

## Quiz Questions
cr <- corr("specdata")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)

cr <- corr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)

cr <- corr("specdata", 2000)                
n <- length(cr)                
cr <- corr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
