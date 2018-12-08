rm(list = ls())

# load packages
library(ggplot2)
library(lubridate) # for dealing with data related to time

# create a fake data set
for_year <- 1997:2016
for_month <- rep(12, 20)
for_day <- rep(31, 20)
col_1 <- paste0(for_year, "-", for_month, "-", for_day)
col_2 <- rep(0, 20)
## simulated data from a random walk
set.seed(20170805)
epsilon <- rnorm(20, mean = 0, sd = 10000)
x0 <- 5*1e5
for(i in 1:20)
{col_2[i] <- x0 + epsilon[i]
 x0 <- col_2[i]
}
fk_data <-
  data.frame(EndOfYear = ymd(col_1),
             Value_in_dollar = round(col_2, 0))

# plot data
p <- 
  ggplot(fk_data, aes(x = year(EndOfYear), y = Value_in_dollar)) +
  # Note the use of function year()
  geom_point() +
  geom_line() +
  scale_y_continuous(labels = scales::dollar) +
  labs(x = "Year", y = "Market value", title = "Plot of a time series") +
  theme(plot.title = element_text(hjust = 0.5))

print(p)
  