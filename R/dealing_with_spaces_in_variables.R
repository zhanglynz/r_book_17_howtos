rm(list=ls())

# load packages
library(stringr)
library(dplyr)

# create a dataframe
fk_data <- data.frame(student_no = 1:4,
                      major = c("maths", " English", " maths ", "English "))

# find the number of students majored in maths
(no_of_maths_majored_students <- sum(fk_data$major == "maths"))
# this does not give the right answer

# fix: remove the spaces 
no_of_students_by_major <- 
  fk_data %>% 
  mutate(major = str_trim(fk_data$major, side = "both")) %>% 
  group_by(major) %>% 
  summarise(count = n())

