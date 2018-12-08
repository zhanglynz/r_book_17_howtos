rm(list = ls())

# load packages
library(dplyr)
library(tidyr) # for gather()
library(ggplot2)

# create a fake data set
set.seed(1234567)
fk_data <-
  data.frame(Normal = rnorm(1000),
             t_df_5 = rt(1000, df = 5),
             Unif = runif(1000, -3, 3),
             Exp = rexp(1000, rate = sqrt(2/pi)),
             Unif_temp = runif(1000, 0, 1)) %>% 
  mutate(the_indi = if_else(Unif_temp <= 0.5, -1, 1)) %>% 
  mutate(Double_exp = Exp * the_indi) %>% 
  select(-Exp, -Unif_temp, -the_indi)  

# prepare data for plotting
plotting_df <-
  fk_data %>% 
  gather(key = distribution, value = rand_number, Normal:Double_exp)

# plot
p <- 
  plotting_df %>% 
  ggplot(aes(x = distribution, y = rand_number, group = distribution)) +
  geom_boxplot() +
  coord_flip() +
  scale_x_discrete(breaks = c("Double_exp", "Normal", "t_df_5", "Unif"), 
                   labels = c("Double Exponential", 
                              "Standard Normal", 
                              "t with df=5", 
                              "Uniform on (-3, 3)")) +
  # NB: use the above to change x-axis tick marks
  labs(x = "Distribution", y = "", title = "Side-by-side box plot") +
  theme(plot.title = element_text(hjust = 0.5))
  
print(p)
