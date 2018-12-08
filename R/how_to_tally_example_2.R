rm(list = ls())

# load packages
library(dplyr)
library(tidyr) # for replace_na()

set.seed(28072017)

# create a fake data
prob_1 <- c(0.2, 0.5, 0.3)
prob_2 <- c(0.3, 0.7)
set_1 <- c("long", "medium", "short")
set_2 <- c("heavy", "light")
set_3 <- c("red", "yellow", "green")
fk_data <- data.frame(size = sample(set_1, 20, replace = TRUE, prob = prob_1),
                      weight = sample(set_2, 20, replace = TRUE, prob = prob_2),
                      color = sample(set_3, 20, replace = TRUE))

tally_5 <-
  fk_data %>% 
  group_by(size) %>% 
  summarise(n = n_distinct(weight, color))
print.data.frame(tally_5)