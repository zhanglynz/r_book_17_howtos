rm(list=ls())

# load packages
library(dplyr)

# create a fake data set
fk_data <- data.frame(x1 = sample(letters[1:5], 20, replace = TRUE), 
                      x2 = sample(LETTERS[1:5], 20, replace = TRUE))

# have a look at the data set
print.data.frame(fk_data)

# create a table
my_table_0 <- table(fk_data$x1, fk_data$x2)
print.table(my_table_0)
# if we want to have row and column totals
my_table_01 <- addmargins(my_table_0)
print.table(my_table_01)

my_table_1 <- as.data.frame.matrix(my_table_0) # convert it to dataframe
# have a look at the table
print.data.frame(my_table_1)

# to have a table of proportions based on rows
my_table_2 <- prop.table(my_table_0, margin = 1) %>% 
              as.data.frame.matrix() # convert it to dataframe   
# have a look at the table
print.data.frame(my_table_2, digits = 2)

# to have a table of proportions based on columns
my_table_3 <- prop.table(my_table_0, margin = 2) %>% 
  as.data.frame.matrix() # convert it to dataframe   
# have a look at the table
print.data.frame(my_table_3, digits = 2)