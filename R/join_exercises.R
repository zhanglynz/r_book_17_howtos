rm(list = ls())

# load packages
library(dplyr)

# create a fake data sets
table_1 <- data_frame(ID_1 = LETTERS[1:6], x = rep(1:3, each = 2))
table_2 <- data_frame(ID_2 = c(LETTERS[1:3], LETTERS[7:8], "A", "B"), y = 1:7)

# Exercise 1
table_3 <- 
  table_2 %>% 
  right_join(table_1, by = c("ID_2" = "ID_1")) %>% 
  # change the order of columns
  select(ID_2, x, y)

# Exercise 2
table_4 <- inner_join(table_1, table_2,  by = c("ID_1" = "ID_2"))
table_5 <- semi_join(table_1, table_2,  by = c("ID_1" = "ID_2"))

# Exercise 3
table_6 <- full_join(table_1, table_2,  by = c("ID_1" = "ID_2"))

# Exercise 4
table_7 <- anti_join(table_1, table_2,  by = c("ID_1" = "ID_2"))

# show tables 4 to 7
list(table_4, table_5, table_6, table_7)