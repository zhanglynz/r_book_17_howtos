rm(list=ls())

# load packages
library(dplyr) # for na.if
library(tidyr) # for replace_na

# create a fake data set
fk_data <- data.frame(v1 = 1:5, 
                      v2 = c(1, 3, NA, 8, -99),
                      v3 = c(NA, NA, rnorm(3)))

# which variables have NA's and how many NA's
colSums(is.na(fk_data))

# which rows have NA's and how many NA's
rowSums(is.na(fk_data))

# get all the rows which have NA's
fk_data_na_rows <- fk_data[rowSums(is.na(fk_data)) > 0, ]

# get all the rows which do not have NA's
fk_data_without_na_rows <- fk_data[rowSums(is.na(fk_data)) == 0, ]
# or
fk_data_without_na_rows <- fk_data[complete.cases(fk_data) == TRUE, ]
# or
fk_data_without_na_rows <- na.omit(fk_data)


# replace all the NA's with 0
fk_data_replace <- fk_data
fk_data_replace[is.na(fk_data_replace)] <- 0
# or directly fk_data[is.na(fk_data)] <- 0, if we don't need fk_data anymore

# replace NA in v3 with 1
fk_data_replace <- 
  fk_data %>% 
  replace_na(list(v3 = 1))

# replace -99 in fk_data by NA
fk_data_1 <- na_if(fk_data, -99)

# find the mean of v2 in fk_data
the_mean <- mean(fk_data$v2, na.rm = TRUE)
