rm(list = ls())

# load packages
library(dplyr)
library(ggplot2)

# create a fake data set
reasons <- c("Reason A", "Reason B", "reason C",
             "Reason D", "Reason E", "reason F")
set_prob <- c(0.1, 0.2, 0.6, 0.05, 0.02, 0.03)

fk_data <-
  data.frame(accident_NO = 1:1000,
             reason = sample(reasons, 1000, replace = TRUE, prob = set_prob))

# prepare the data for plotting
plotting_df <-
  fk_data %>% 
  group_by(reason) %>% 
  summarise(freq = n()) %>% 
  arrange(desc(freq)) %>%
  mutate(relative_freq = freq / sum(freq),
         cumulative_freq = cumsum(relative_freq)) 
## get the order of bars
the_order <- plotting_df$reason

# plot
p <- 
  plotting_df %>% 
  ggplot(aes(x = reason, weight = relative_freq)) +
  geom_bar(width = 0.5, fill = "blue") +
  scale_x_discrete(limits = the_order) +
  scale_y_continuous(label = scales::percent) +
  geom_point(aes(x = reason, y = cumulative_freq)) +
  geom_line(aes(x = reason, y = cumulative_freq, group = 1)) +
  # NB: Must use "group = 1"
  labs(x = "", y = "Relative frequency", 
       title = "A Pareto diagram for reasons of 1000 accidents") +
  theme(plot.title = element_text(hjust = 0.5))
  # NB: Use theme to center the title

print(p)
  
   