rm(list = ls())

# load packages
library(ggplot2)
library(dplyr)

# prepare a dataframe for plotting
fruits <- c("apple", "orange", "banana", "pear", "plum", 
            "kiwi fruit", "peach", "mango", "lemon")
the_fruits <- sample(fruits, 1000, replace = TRUE)

a_table <- table(the_fruits)
plotting_df <- 
  as.data.frame.table(a_table) %>% 
  mutate(proportion = Freq / sum(Freq))

## Create a vector to order the fruits in terms of proportion 
for_sorting <- plotting_df %>%
  arrange(proportion)
fruits_order <- for_sorting$the_fruits

# plotting
p <- ggplot(plotting_df, aes(x = the_fruits, weight = proportion)) +
  # NB: use "weight = proportion" instead of "y = proportion"
  geom_bar(width = 0.5, fill = "blue") +
  # NB: use "width" and "fill" to change the default bar width and color
  labs(x = "", y = "", 
       title = "A 'horizontal' bar chart for a basket of fruits") +
  coord_flip() +
  # NB: use "coord_flip" to flip coordinates
  scale_x_discrete(limits = fruits_order) +
  # NB: use the above to set the order of bars
  scale_y_continuous(limits = c(0, max(plotting_df$proportion)+0.015)) +
  # NB: use the above to make the plot slightly bigger than the default one
  geom_text(aes(x = the_fruits, y = proportion + 0.006, 
                label = scales::percent(proportion))) +
  # NB: use the above to put the the pentage numbers to indicate lengths of bars
  theme(plot.title = element_text(hjust = 0.5), 
        axis.text.x = element_blank(),
        axis.ticks = element_blank()) 
  # NB: use theme to center the title, to remove axis text and ticks
  

print(p)
