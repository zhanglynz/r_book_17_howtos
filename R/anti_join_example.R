rm(list = ls())

# load packages
library(dplyr)

# creat a fake data set
fk_data <- 
  data_frame(x = sample(letters, 30, replace = TRUE),
             y = rnorm(30))

rm_data <- data_frame(rm_letters = letters[1:3])
## rm is for removing

fk_data_1 <-
  fk_data %>% 
  anti_join(rm_data, by = c("x" = "rm_letters"))