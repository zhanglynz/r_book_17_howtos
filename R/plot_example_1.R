rm(list = ls())

# load packages
library(ggplot2)

# prepare a dataframe for plotting
fruits <- c("apple", "orange", "banana")
the_fruits <- sample(fruits, 100, replace = TRUE)

plotting_df <- as.data.frame.table(table(the_fruits))

# plotting
p <- ggplot(plotting_df, aes(x = the_fruits, weight = Freq)) +
  # NB: use "weight = Freq" instead of "y = Freq"
  geom_bar(width = 0.5, fill = "blue") +
  # NB: use "width" and "fill" to change the default bar width and color
  labs(x = "", y = "Frequency", 
       title = "A basic bar chart for a basket of fruits") +
  theme(plot.title = element_text(hjust = 0.5)) +
  # NB: use theme to center the title
  geom_text(aes(x = the_fruits, y = Freq + 1, label = Freq)) 
  # NB: use "geom_text" to put the the numbers to indicate heights of bars

print(p)
