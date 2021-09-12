my_mean <- function(my_vector) {
  sum(my_vector)/length(my_vector)
}

remainder <- function(num, divisor = 2) {
  num %% divisor
}

# evaluate() should act:
#    1. evaluate(sum, c(2, 4, 6)) should evaluate to 12
#    2. evaluate(median, c(7, 40, 9)) should evaluate to 9
#    3.evaluate(median, c(7, 40, 9))should evaluate to 11

evaluate <- function(func, dat){
  func(dat)
}

telegram <- function(...){
  paste("START", ... , "STOP")  
}

mad_libs <- function(...){
  # Do your argument unpacking here!
  args <- list(...)
  place = args[["place"]]
  adjective = args[["adjective"]]
  noun = args[["noun"]]
  
  # Don't modify any code below this comment.
  # Notice the variables you'll need to create in order for the code below to
  # be functional!
  paste("News from", place, "today where", adjective, "students took to the streets in protest of the new", noun, "being installed on campus.")
}


"%p%" <- function(a, b){ # Remember to add arguments!
  paste(a, b)
}
