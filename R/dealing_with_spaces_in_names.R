rm(list=ls())

# load packages
library(ggplot2)

# Create a dataframe
set.seed <- 12345
fk_data <- data.frame(Year = rep(2011:2015, each = 4), 
                    AvgScore = round(rnorm(20, mean=50, sd=5), 0),
                    Gender = rep(c("Male", "Female"), 10))

# An extra variable
fk_data$"Subject " <- rep( c(rep("Maths", 2), rep("Stats", 2)), 5 )


# Make a plot
ggplot(fk_data, aes(x = Year, y = AvgScore, group = Gender, colour = Gender)) +
  geom_point() +
  geom_line() +
  facet_grid( . ~ Subject  )  
# The above plotting does not work

# What about the following
ggplot(fk_data, aes(x = Year, y = AvgScore, group = Gender, colour = Gender)) +
  geom_point() +
  geom_line() +
  facet_grid( . ~ "Subject " )
# It does not work either

# The first fix
# We don't remove the space in "Subject "
ggplot(fk_data, aes(x = Year, y = AvgScore, group = Gender, colour = Gender)) +
  geom_point() +
  geom_line() +
  facet_grid( . ~ `Subject ` ) # backticks! It works fine here.
# Thanks to http://stackoverflow.com/questions/4551424/how-to-refer-to-a-variable-name-with-spaces


# The second fix.
# We remove the space in "Subject "
fk_data$Subject <- fk_data$"Subject " # create a new column/variable
fk_data$"Subject " <- NULL # remove the column
# Now make the plot
ggplot(fk_data, aes(x = Year, y = AvgScore, group = Gender, colour = Gender)) +
  geom_point() +
  geom_line() +
  facet_grid( . ~ Subject )

