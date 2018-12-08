rm(list = ls())

# load package
library(dplyr)

source("simple_recoding.R")

# create a fake data set
fk_data <- data.frame(my_colors = c("red", "orange", "yellow", "green", "blue"))

fk_data_1 <- 
  fk_data %>% 
  mutate(RGB = simple_recoding(my_colors, 
                               from = my_colors, 
                               to = c("R", "G", "B"),
                               mapping_rule_data = c(1, 3, 4, 4, 5, 5)))