
myfunction <- function() {
	x <- rnorm(100)
	mean(x)
}

myfunction2 <- function(x) {
	x + rnorm(length(x))
}

myfunction3 <- function(x, y) {
	x + y + rnorm(length(x))
}

