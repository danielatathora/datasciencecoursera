## Coursera Week 2 ggplot


# library("ggplot2") or library(ggplot2)

#=======================================================
# sample
library(ggplot2)
data(mpg)
qplot(displ, hwy, data = mpg)
#=======================================================

# get hepl on qplot
? qplot

names(mpg)

# qplot(x-coord, y-coord, dataframe)
qplot(displ,   hwy,     data = mpg)


# example 3 "Hello World"

# qplot(x-coord, y-coord, dataframe)
qplot(displ,   hwy,     data = mpg)

# modifying aesthetics
qplot(displ,   hwy,     data = mpg, color = drv)

# adding a statistic with qplot()
qplot(displ, hwy, data = mpg, geom = c("point", "smooth"))

qplot(displ, hwy, data = mpg) +geom_smooth()

library(ggplot2)
library(ggplot2movies)
g <- ggplot(movies, aes(votes, rating))
print(g)


# histogram using qplot()
qplot(hwy, data = mpg, fill = drv)



# facets (split data into seporate groups when there are many points and colour alone is not the best option)

par(mfrow=c(2,1))
# one row , many columns . ~ drv
qplot(displ, hwy, data = mpg, facets = . ~ drv )

# many rows, one olumn  drv ~ .
qplot(hwy, data = mpg, facets = drv ~ ., binwidth = 2 )




print("using read.tabe")        
rm(maacs)

# maacs <- readRDS("maacs_env.rds") # missing columns
load("maacs.Rda")
head(maacs)
summary(maacs)
maacs$logpm25

qplot(logpm25, NocturnalSympt, data = maacs, facets = . ~ bmicat
      ,geom = c("point", "smooth"), method = "lm")



# ---
head(maacs[, 1:3])

maacs$logpm25
g <- ggplot(maacs, aes(logpm25, NocturnalSympt))

summary(g) # get a summary on a ggplot object

print(g) # ont work as needs layers

p <- g + geom_point()

print(p) # no we see a plot

# plot it it in one go

g <- ggplot(maacs, aes(logpm25, NocturnalSympt))
g + geom_point()

# Or
ggplot(maacs, aes(logpm25, NocturnalSympt)) + geom_point()


# adding more layers : smooth

g + geom_point() + geom_smooth()

g + geom_point() +  geom_smooth(method = "lm")

# adding more  layers : facets

# very cool - produced two panel (Normal Weight and overweight)
g + geom_point() + facet_grid( . ~ bmicat) + geom_smooth(method = "lm")


#
# Modifying Aesthetics
#

g + geom_point(color = "steelblue", size = 4, alpha = 1/2)  

g + geom_point(aes(color = bmicat), size = 4, alpha = 1/2) 

# adding labels

g + geom_point(aes(color = bmicat)) + labs(title = "MAACS Cohort") + labs(x = expression("log " * PM[2.5]), y = "Nocturnal Symtoms")

# customize the smoother

# modify the smoother
g + geom_point(aes(color = bmicat), size = 2, alpha = 1/2) +
  geom_smooth(size = 4, linetype = 3, method = "lm", se = FALSE)


#
# Changing the theme
#
g + geom_point(aes(color = bmicat)) + theme_bw(base_family = "Times")


# generate some data with an outlier
testdat <- data.frame(x = 1:100, y = rnorm(100))
testdat[50,2] <- 100 ## Stick in an Outlier! sure why not

# base system
plot(testdat$x, testdat$y, type = "l", ymil = c(-3, 3))

# ggplot ststem
g <- ggplot(testdat, aes(x = x, y = y))
g + geom_line()

     

# to exclude ot include the outlier

g + geom_line() + ylim(-3, 3) # Outlier missing (gap)

g + geom_line() + coord_cartesian(ylim = c(-3, 3))


# More complex problem

# catergorise a continious variables

## Calculate the deciles of the data (length = 4 splits into 0%, 33%, 66% and 100%)
cutpoints = quantile(maacs$logno2_new, seq(0, 1, length = 4), na.rm = TRUE)
cutpoints

## Cut the data at the deciles and create a new factor variable
maacs$no2dec <- cut(maacs$logno2_new, cutpoints)

## See the levels og the newly created factor variable
levels(maacs$no2dec)



## Setup ggplot with a data frame
g <- ggplot(maacs, aes(logpm25, NocturnalSympt))

## Add layers
g + geom_point(alpha = 1/3) +
  facet_wrap(bmicat ~ no2dec, nrow = 2, ncol = 4) +
  geom_smooth(method="lm", se=FALSE, col="steelblue") +
  theme_bw(base_family = "Avenir", base_size = 10) +
  labs(x = expression("log " * PM[2.5])) + 
  labs(y = "Nocturnal Symptoms") +
  labs(title = "MAACS Cohort")

# --------------------------

library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)

library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)
print(p)


data(airquality)
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month))



# revison
qplot(log(eno), data = maacs, geom = "density")

qplot(log(eno), data = maacs, geom = "density", color = mopos)

qplot(log(pm25), log(eno), data - maacs, facets = .~ mopos) + geom_smooth(method = "lm"))


q <- qplot(etstdat, aes(x = x, y = y))
q + geom_line()
