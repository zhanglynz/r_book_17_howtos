rm(list = ls())

# load packages
library(dplyr)

# create a fake data sets
table_1 <- data_frame(ID_1 = LETTERS[1:6], x = rep(1:3, each = 2))
table_2 <- data_frame(ID_2 = c(LETTERS[1:3], LETTERS[7:8], "A", "B"), y = 1:7)

# join tables 1 and 2
table_3 <- left_join(table_1, table_2, by = c("ID_1" = "ID_2"))

# shwo the three tables
list(table_1, table_2, table_3)