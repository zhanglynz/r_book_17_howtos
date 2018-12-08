rm(list = ls())

# load packages
library(dplyr)
library(tidyr) # for spread()

# create a fake data set
fk_data <- data.frame(category_1 = c(rep("A", 3), "B", rep("C", 2), NA, NA), 
                      category_2 = c(rep("a", 2), rep("b", 2), rep(NA, 3), "c"))

# show the tale created by using table()
print.table(table(fk_data$category_1, fk_data$category_2))

# create a contingency table using dplyr::tally and tidyr::spread
a_table <-
  fk_data %>% 
  group_by(category_1, category_2) %>% 
  tally() %>% 
  spread(key = category_2, value = n)
print.data.frame(a_table)
