simple_recoding <- function(v, from, to, mapping_rule_data = NULL)
{L <- length(v)
 N <- length(to)
 
 if(is.null(mapping_rule_data) == TRUE) 
  {mapping_rule <- matrix(rep(1:N, each = 2), N, 2, byrow = TRUE)}
 else
  {mapping_rule <- matrix(mapping_rule_data, N, 2, byrow = TRUE)}
 
 the_result <- rep("", L)
 
 for(i in 1:L)
   for(j in 1:N)
   {a <- mapping_rule[j, 1]
    b <- mapping_rule[j, 2]
    if(v[i] %in% from[a : b]) the_result[i] <- to[j]
   }
 return(the_result)
}