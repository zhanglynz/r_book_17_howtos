rm(list=ls())

library(dplyr)

# create fake data
fk_data <- data.frame(ID = sample(1000:9999999, 1000, replace = FALSE),
                      d = rnorm(1000))

# data manipulation
fk_data <- fk_data %>% 
  mutate(ID = sprintf("%07d", ID))