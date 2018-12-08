rm(list=ls())

# load packages
library(dplyr)

# create fake data
fk_data <- data.frame(ID = sample(1000:9999999, 1000, replace = FALSE),
                      d = rnorm(1000))

# a helper function
helper_func <- function(x)
{m <- length(x)
 y <- rep("", m)
 for(i in 1:m) if(x[i] > 0) y[i] <- paste(rep(0, x[i]), collapse = "")
 return(y)
}

# data manipulation
fk_data <- fk_data %>% 
  mutate(no_zeros = 7 - ceiling(log10(ID))) %>% 
  mutate(the_zeros = helper_func(no_zeros)) %>% 
  mutate(ID = paste0(the_zeros, ID)) %>% 
  select(-no_zeros, -the_zeros )