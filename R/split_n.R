split_n <- function(n, m)
{n <- as.integer(abs(n))
 m <- as.integer(abs(m))
 
 if(n == 0L | m < 2L) print("n must be postive and m must be larger than 2.")
 else
 {the_weights <- gtools::rdirichlet(1, rep(1, m)) 
  # Sometimes the following weighting is useful
  # the_weights <- gtools::rdirichlet(1, abs(rnorm(m))) 
  the_weights <- as.vector(the_weights)
  the_split <- floor(n * the_weights) # always rounding down
  left_number <- n - sum(the_split)
  # randomly choose the positions where extra 1 will be added to the_split
  the_position <- sample(1:m, left_number)  
  the_split[the_position] <- the_split[the_position] + 1
  return(the_split)
 }
}

(split_n(10, 4))