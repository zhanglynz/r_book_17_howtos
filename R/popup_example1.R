rm(list = ls())

# load packages
library(readr) # for read_csv
library(ggplot2)
library(plotly)

# read data in
the_url <- "https://raw.githubusercontent.com/LarryZhang2016/Data/master/NZ_cities.csv"
NZ_cities <- read_csv(the_url, skip =1)

p1 <-
  ggplot(NZ_cities, aes(x = Area_in_km2, y = Population, fill = City_name,
                        text = paste0('City: ', City_name,
                                      '<br>Area (in km^2): ', Area_in_km2,
                                      '<br>Population: ', Population
                                      ))) +
  geom_point() +
  scale_y_continuous(labels = scales::comma) +
  # NB: use the above to mark large numbers 
  labs(x = "Area (in km^2)", y = "Population Size",
       title = paste0("Population vs. area for the top 15\n",
                      "NZ's most populous cities")) +
  # NB: use paste0 to break a long line to two lines
  theme(plot.title = element_text(hjust = 0.5), 
        legend.position="none", 
        plot.margin = unit(c(t = 1, r = 0.5, b = 0.5, l = 1.5), "cm"))

ggplotly(p1, tooltip = c("text")) %>% config(displayModeBar = FALSE)

