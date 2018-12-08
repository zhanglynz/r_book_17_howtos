rm(list = ls())

library(ggplot2)
library(dplyr)

# create a fake data set
set.seed(9072017)
rand_numbers <- abs(rnorm(26))
the_prob <- rand_numbers/sum(rand_numbers)
fk_data <- data.frame(x = sample(LETTERS, 10000, replace = TRUE,
                                 prob = the_prob))

# prepare data for plotting
plotting_df <-
  fk_data %>% 
  group_by(x) %>% 
  summarise(Freq = n()) %>% 
  mutate(proportion = Freq/sum(Freq)) %>% 
  arrange(proportion)

the_order <- plotting_df$x

# plotting

p <- 
  plotting_df %>% 
  ggplot(aes(x = x, y = proportion)) +
  geom_segment(aes(x = x, xend = x, y = 0, yend = proportion)) +
  # use the above to plot segments
  geom_point() +
  # use the above to plot points
  scale_x_discrete(limits = the_order) +
  scale_y_continuous(labels = scales::percent) +
  labs(x = "Category", y = "Proportion", 
       title = "A lollipop chart") +
  theme(plot.title = element_text(hjust = 0.5))
  # use the above to center the title

print(p)
  
  
 