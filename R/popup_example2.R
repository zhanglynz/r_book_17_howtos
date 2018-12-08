rm(list = ls())

# load packages
library(readr) # for read_csv
library(ggplot2)
library(googleVis)

# read data in
the_url <- "https://raw.githubusercontent.com/LarryZhang2016/Data/master/NZ_cities.csv"
NZ_cities <- read_csv(the_url, skip =1)

p <- gvisBubbleChart(NZ_cities, xvar = "Area_in_km2", yvar = "Population", 
                      colorvar="City_name", sizevar="Population_density",
                      options=list(
                         title=paste0("Population vs. area for the \n",
                                      "top 15 NZ's most populous cities"),
                         hAxis="{title:'Area (in km^2)'}",
                         vAxis="{title:'PopSize'}", 
                         legend="none",
                         width=800, height=800))

plot(p)

