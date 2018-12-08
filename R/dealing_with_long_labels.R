rm(list = ls())

# load packages
library(dplyr)
library(stringr)
library(ggplot2)
library(plotly)

# create a fake data set
x <- rep("", 17)
for(i in 1:17) x[i] <- paste0(letters[1:(i+9)], collapse="")
fk_data <- data.frame(var_name = x,
                      bar_height = nchar(x))

# create a bar chart
p_0 <- 
  ggplot(fk_data, aes(x = var_name, y = bar_height)) +
  geom_bar(stat = "identity", fill ="blue", size = 0.2 ) +
  coord_flip()
ggplotly(p_0)
  