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

# tally one variable
tally_1 <- 
  fk_data %>% 
  group_by(color) %>% 
  tally()
print.data.frame(tally_1)

# tally two varaibles
tally_2 <-
  fk_data %>% 
  group_by(size, weight) %>% 
  tally()
print.data.frame(tally_2)

# tally three variables
tally_3 <-
  fk_data %>% 
  group_by(size, weight, color) %>% 
  tally() %>% 
  arrange(size, weight, color)
print.data.frame(tally_3)

# The following is to refine tally3
# to show all combinations of levels of the three factors
# Step a: to have a dataframe which has 
# all the level combinations
levels_comb_df <- 
  expand.grid(size = levels(fk_data$size), 
              weight = levels(fk_data$weight),
              color = levels(fk_data$color))
# Step b: create tally4 by join
# Notice the difference between tally3 and tally 4
tally_4 <- 
  levels_comb_df %>% 
  left_join(tally_3, by =c("size" = "size",
                          "weight" = "weight",
                          "color" = "color")) %>% 
  # replace na by 0
  replace_na(list(n=0)) %>% 
  arrange(size, weight, color)
print.data.frame(tally_4)
  
  
