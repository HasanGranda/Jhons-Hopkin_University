# 1. Suppose I define the following function in R

cube <- function(x, n) {
  x^3
}

cube(3)

#3. Consider the following function

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}

z <- 10
f(3)

#4. Consider the following expression:

x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}
y

#Consider the following R function

h <- function(x, y = NULL, d = 3L) {
  z <- cbind(x, d)
  if(!is.null(y))
    z <- z + y
  else
    z <- z + f
  g <- x + y / z
  if(d == 3L)
    return(g)
  g <- g + 10
  g
}

