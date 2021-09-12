## Coursera Week 2 lattice



#---------------------
# example: multi panels
library(lattice)
state <- data.frame(state.x77, region = state.region)
xyplot(Life.Exp ~ Income | region, data = state, layout = c(4,1))
#---------------------

#---------------------
# example: simple
library(lattice)
library(datasets)
## Simple scatterplot
xyplot(Ozone ~ Wind, data = airquality)

#--------------------

# example: mode complex
library(lattice)
library(datasets)
## Convert 'Month' to a factor variable
xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))
#---------------------
p <- xyplot(Ozone ~ Wind | Month, data = airquality, layout = c(5, 1))
print(p)

set.seed(10)
x <- rnorm(100)
f <- rep(0:1, each = 50)
y <- x + f - f * x + rnorm(100, sd = 0.5)
f <- factor(f, labels = c("Group 1", "Group 2"))
xyplot(y ~ x | f, layout = c(2, 1)) ## Plot with 2 panels



## custom panel function
xyplot(y ~ x | f, panel = function(x, y, ...) {
  panel.xyplot(x, y, ...) ## First call the default panel function for 'xyploy'
  panel.abline(h = median(y), lty = 2)  ## Add a horizonal line at the median
})

xyplot(y ~ x | f, panel = function(x, y, ...) {
  panel.xyplot(x, y, ...) ## First call the default panel function for 'xyploy'
  panel.lmline(x, y, col = 2)  ## Overley a simple linear regression line
})

