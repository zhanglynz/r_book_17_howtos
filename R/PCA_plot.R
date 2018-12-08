rm(list=ls())

# load packages
library(dplyr, quietly = TRUE)
library(ggplot2, quietly = TRUE)

# NB: We will use iris, which is a data set from R 
(head(iris))

# do the mapping
## step 1: find the covariance
the_cov <-  cov(iris[, 1:4]) 

## step 2: find the eigen values and vectors
the_eigen <- eigen(the_cov)

## Remark: steps 1 and 2 together is equivalent to 
## PC <- prcomp(iris[, 1:4])

## step 3: mapping
map_2_PC1_PC2 <- 
  as.matrix(iris[,1:4]) %*% the_eigen[[2]][, 1:2]  %>% 
  as.data.frame()

# check how much variance are expressed by PC1 and PC2
(the_proportions = the_eigen[[1]][1:2]/sum(the_eigen[[1]]))
  
# prepare dataframe for plotting
temp_df <- data.frame(Species = iris[, 5])
plotting_df <- 
  bind_cols(map_2_PC1_PC2, temp_df) %>%
  rename(PC1 = V1, PC2 = V2)

# plotting
ggplot(plotting_df, aes(x = PC1, y = PC2, color = Species)) +
  geom_point()
  





