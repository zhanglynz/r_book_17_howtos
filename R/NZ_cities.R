rm(list = ls())

# load packages
library(treemap)
library(readr) # for read_csv

# read data in
the_url <- "https://raw.githubusercontent.com/LarryZhang2016/Data/master/NZ_cities.csv"
NZ_cities <- read_csv(the_url, skip =1)

# make a tree map
treemap(dtf = NZ_cities,
        index=c("City_name"),
        vSize="Population",
        vColor="Population_density",
        palette="Spectral",
        type="value",
        border.col=c("grey70", "grey90"),
        fontsize.title = 18,
        algorithm="pivotSize",
        title ="Treemap of the top 15 NZ's most populous cities",
        title.legend="Population density (people/km^2)")

