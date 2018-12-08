rm(list = ls())

# load packages
library(readr) # for read_csv
library(ggplot2)

# read data in
the_url <- "https://raw.githubusercontent.com/LarryZhang2016/Data/master/NZ_cities.csv"
NZ_cities <- read_csv(the_url, skip =1)

p1 <-
  ggplot(NZ_cities, aes(x = Area_in_km2, y = Population)) +
  geom_point() +
  scale_y_continuous(labels = scales::comma) +
  # NB: use the above to mark large numbers 
  labs(x = "Area (in km^2)", 
       title = paste0("Population vs. area for the \n",
                      "top 15 NZ's most populous cities")) +
  # NB: use paste0 to break a long line to two lines
  theme(plot.title = element_text(hjust = 0.5))

print(p1)

# Next, we want to label the points for 
# Auckland, Wellington, Christchurch, and Hamilton with their names and red
# Also, add the regression line in

# load packages
library(dplyr)
library(ggrepel) # for geom_text_repel()

# add two new columns to NZ_cities
biggest_cities <- c("Auckland", "Wellington", "Christchurch","Hamilton")
NZ_cities_1 <- 
  NZ_cities %>% 
  mutate(the_label = if_else(City_name %in% biggest_cities, City_name, ""),
         the_color = if_else(City_name %in% biggest_cities, "red", "black"))

p2 <-
  p1 +
  geom_text_repel(data = NZ_cities_1, aes(label = the_label)) +
  geom_point(color = NZ_cities_1$the_color) +
  # add in the regression line
  geom_smooth(method = "lm", se = FALSE) 

print(p2)

# Finally, refit the data after removing "Auckland", "Wellington", "Christchurch"
# add in the new regression line
NZ_cities_2 <- 
  NZ_cities %>%
  filter(!(City_name %in% biggest_cities[1:3])) %>% 
  select(City_name, Population, Area_in_km2)

## find the regression equtions
line_1 <- lm(Population ~ Area_in_km2, NZ_cities)
line_2 <- lm(Population ~ Area_in_km2, NZ_cities_2)
line_1_eq <- paste0("Line 1: ", "Population = ", 
                    round(line_1[[1]][1], 2), " + ",
                    round(line_1[[1]][2], 2), " * Area")
line_2_eq <- paste0("Line 2: ", "Population = ", 
                    round(line_2[[1]][1], 2), " + ",
                    round(line_2[[1]][2], 2), " * Area")

p3 <- 
  p1 +
  geom_text_repel(aes(label = NZ_cities_1$the_label)) +
  geom_point(color = NZ_cities_1$the_color) +
  # add in the regression line
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  geom_smooth(data = NZ_cities_2, method = "lm", se = FALSE, color = "purple") +
  annotate(geom = "text", x = 400, y = 1400000, 
           label=line_1_eq, color="blue") +
  annotate(geom = "text", x = 400, y = 1250000, 
           label=line_2_eq, color="purple")

print(p3)
  