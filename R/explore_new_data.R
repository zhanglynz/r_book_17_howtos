rm(list=ls())

# Firstly, we must read data into R
# Here I will use fake data
fk_data <- data.frame(ob_id = 1:100, 
                      l_lower_case = sample(letters, 100, replace = TRUE),
                      rand_number = rnorm(100),
                      l_upper_case = sample(LETTERS, 100, replace = TRUE),
                      true_or_false = sample(c("T", "F"), 100, replace = TRUE)
                     )

# Find the dimensions
d <- dim(fk_data)

# Find the structure
str(fk_data)

# See the first 6 rows
head(fk_data)

# See the last 6 rows
tail(fk_data)

# Find the column names
the_names <- names(fk_data)

# Find possible values of "l_lower_case"
possible_values <- unique(fk_data$l_lower_case)

# Find summary of "rand_number"
the_summary <- summary(fk_data$rand_number)

# View the data set
View(fk_data)

