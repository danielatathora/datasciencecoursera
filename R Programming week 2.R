# If format: 1
x <- 3
if( x > 3 ) {
	y <- 10
} else {
	y <- 100
}
print(y)

# If format: 2 (r specific)
y <- if( x > 3 ) { 
	10
	} else {
		100
	}
print(y)
	
for( i in 1:10) {
	print(i)
}

x <- c("a", "b", "c", "d")

for( i in 1:4) {
    print(x[i])
}

for( i in seq_along(x)) {
    print(x[i])
}

for( i in 1:4) print(x[i])
