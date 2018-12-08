library(profvis)
profvis({
  x <- rnorm(10e6)
  total_1 <- 0
  for(i in 1:10e6) total_1 <- total_1 + x[i]
  total_2 <- sum(x)
  list(total_1, total_2)
})