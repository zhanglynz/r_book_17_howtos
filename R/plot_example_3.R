rm(list = ls())

# load packages
library(ggplot2)
library(dplyr)

#-------------------
# Aim: To plot numbers of all kinds of fruits in "local" and "imported" groups
#-------------------


# prepare a dataframe for plotting
fruits <- c("apple", "orange", "banana", "pear", "plum", 
            "kiwi fruit", "peach", "mango", "lemon")
origin <- c("local", "imported")


a_df <- data.frame(the_fruits = sample(fruits, 1000, replace = TRUE),
                   the_origin = sample(origin, 1000, replace = TRUE)) 

plotting_df <-
  a_df %>%  
  group_by(the_origin, the_fruits) %>% 
  summarise(Freq = n())
 
# ------------ side-by-side bar chart --------------
## set the order of bars according to local fruits   
temp_df_1 <-
  plotting_df %>% 
  filter(the_origin == "local") %>% 
  arrange(Freq)
the_order <- temp_df_1$the_fruits

## plot a side-by-side bar chart
p1 <- 
  plotting_df %>% 
  ggplot(aes(x = the_fruits, weight = Freq, fill = the_origin)) +
  geom_bar(position = "dodge", width = 0.75) +
  # NB: use the above to plot bars in the certain order
  coord_flip() +
  scale_x_discrete(limits = the_order) +
  labs(x = "", y = "Number of fruits in the 'basket'") +
  scale_fill_brewer(breaks=c("local", "imported"), palette = "Set1") +
  # NB: use the above to change the default order and color of legend
  theme(legend.position = "bottom",
        legend.title = element_blank(),
        axis.text = element_text(size=12),
        axis.title = element_text(size=14), 
        plot.title = element_text(size=14),
        legend.text = element_text(size=9),
        panel.background = element_rect(fill =  "grey90"))

print(p1)

# ------------ stacked bar chart --------------
## set the order according to totals
temp_df_2 <-
  a_df %>% 
  group_by(the_fruits) %>% 
  summarise(the_count = n()) %>% 
  arrange(the_count)
the_order_2 <- temp_df_2$the_fruits

## plot a stacked bar chart
p2 <- 
  plotting_df %>% 
  ggplot(aes(x = the_fruits, y = Freq, group = the_origin, fill = the_origin)) +
  # NB: use "y = Freq" instead of "weight = Freq"
  geom_bar(stat = "identity", position = "stack", width = 0.75) +
  coord_flip() +
  scale_x_discrete(limits = the_order_2) +
  # NB: use the above to plot the bars in order
  labs(x = "", y = "Number of fruits in the 'basket'") +
  scale_fill_brewer(breaks=c("local", "imported"), palette = "Set1") +
  # NB: use the above to change the default order and color of legend
  theme(legend.position = "bottom",
        legend.title = element_blank(),
        axis.text = element_text(size=12),
        axis.title = element_text(size=14), 
        plot.title = element_text(size=14),
        legend.text = element_text(size=9),
        panel.background = element_rect(fill =  "grey90"))

print(p2)



