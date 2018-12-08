rm(list = ls())

# load packages
library(dplyr)
library(tidyr)
library(ggplot2)

# create a fake data set
## a helper function
set.seed(21072017)
create_year_data <- function(year = 2015, n = 20)
{temp_df <- data.frame(year = rep(year, n),
                       gender = sample(c("male", "female"), n, replace = TRUE),
                       stats_grade = rnorm(n, mean = 55, sd = 10),
                       math_grade = rnorm(n, mean = 60, sd = 10))
 return(temp_df)
}

data_2016 <- create_year_data(year = 2016, n = 20)
data_2015 <- create_year_data(year = 2015, n = 20)
data_2014 <- create_year_data(year = 2014, n = 20)

fk_data <- bind_rows(data_2016, data_2015, data_2014)

# prepare data for plotting
plotting_df <-
  fk_data %>% 
  group_by(year, gender) %>% 
  summarise(Stats = mean(stats_grade),
            Maths = mean(math_grade)) %>% 
  ungroup() %>% 
  # make a long table
  gather(key = subject, value = grade, -year, -gender) %>% 
  arrange(year)

# plot
the_title <- paste0("Averge maths and stats grades for\n",
                    "female and male students in 2014-2016")
p <- 
  plotting_df %>% 
  ggplot(aes(y = grade, color = gender)) +
  geom_segment(aes(x = gender, xend = gender, y = 0, yend = grade)) +
  geom_point(aes(x = gender, y = grade)) +
  coord_flip() +
  scale_x_discrete(limits = c("male", "female")) +
  facet_grid(year ~ subject) +
  labs(x = "", y = "Average Grade", 
       title = the_title) +
  theme(plot.title = element_text(hjust = 0.5),
        legend.title = element_blank(),
        panel.background = element_rect(fill =  "grey90")) 

print(p)
  
