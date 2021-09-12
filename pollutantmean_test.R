# pollutantmean_test.R - Test pollutant.R

# Coursera R Programming Week 3 Assignment 1

setwd("~/Documents/Coursera_Data_Science/Course_2_R_Programming/Week_2")
getwd()

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

# Exam Quiz
pollutantmean("specdata", "sulfate", 1:10)
# [1] 4.064128

pollutantmean("specdata", "nitrate", 70:72)
# [1] 1.706047

pollutantmean("specdata", "sulfate", 34)
# [1] 1.477143

pollutantmean("specdata", "nitrate")
# [1] 1.702932


