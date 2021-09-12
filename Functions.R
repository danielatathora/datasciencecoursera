# FUNCTIONS
add2 <- function(x, y) { 
	x + y
}
# add2(10,14)

# above 10
above10 <- function(x) {
	# x[x >10]
	# or use a varubale
	use <- x > 10
	x[use]
}

# above10(c(1:20))

# above X default 10
above <- function(d,x=10) {
	# d[d > x]
	# or use a varubale
	use <- d > x
	d[use]
}

# above(c(1:20), 19)
# above(c(1:20))


columnmean <- function(y, removeNA = TRUE) {
    nc <- ncol(y)
    means <- numeric(nc)    # initial vector of columns (to zero)
    for( i in 1:nc) {
        means[i] <- mean(y[,i], na.rm = removeNA)
    }
    means
}

# columnmean(airquality)
# columnmean(airquality, FALSE)
# columnmean(airquality, TRUE)
