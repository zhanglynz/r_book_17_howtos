data_dic_builder <- function(df, variable_type)
{df <- as.data.frame(df) # make sure df is a dataframe

 n <- dim(df)[2]
 
 length_of_uniq_var <- rep(0, n)
 length_of_uniq_var_1 <- rep(0, n)  
 
 for(i in 1:n)
  {length_of_uniq_var[i] <- length(unique(df[, i]))
   length_of_uniq_var_1[i] <- ifelse(variable_type[i] == 0, 1, 
                                     length_of_uniq_var[i])
  }

 m <- sum(variable_type * length_of_uniq_var)  + sum(variable_type == 0)
 
 long_list_1 <- rep("", m)
 long_list_2 <- rep("", m)
 the_var_names <- names(df)
 
 the_cum_length <- cumsum(length_of_uniq_var_1)
 
 for(i in 1:n)
 {if(length_of_uniq_var_1[i] == 1) 
   {temp_char_1 <- the_var_names[i]
    temp_char_2 <- as.character(length_of_uniq_var[i])
   } else {temp_char_1 <- c(the_var_names[i], rep("", length_of_uniq_var_1[i] - 1))
           temp_char_2 <- as.character(unique(df[, i]))}
  
  start_point <- ifelse(i==1, 1, the_cum_length[i-1] + 1)
  end_point <- the_cum_length[i]
  
  long_list_1[start_point:end_point] <- temp_char_1
  
  long_list_2[start_point:end_point] <- temp_char_2
 }
 
 output_df <- data.frame(Var_name = long_list_1, 
                         Unique_n_or_unique_values = long_list_2)
 return(output_df)
}