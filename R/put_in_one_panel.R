rm(list = ls())

# load packages
library(gridExtra)
library(ggplot2)

# a function for plotting probability density functions
plot_density <- function(func_name = dnorm, para = list(mean=0, sd=1),
                         domain = data.frame(x = c(-3, 3)),
                         title_lable = "PDF of N(0, 1)")
{p <- ggplot(domain, aes(x)) + 
  stat_function(fun = func_name, args = para, color = "red") +
  labs(x = "x", y = "f(x)", title = title_lable) +
  theme(plot.title = element_text(hjust = 0.5)) # make the title in center
 return(p)
}

# plot four probability density functions 
p1 <- plot_density()
p2 <- plot_density(func_name = dt, para = list(df=30),
                   title_lable = "PDF of t distribution with df=30")
p3 <- plot_density(func_name = dexp, para = list(rate = 1),
                   domain = data.frame(x = c(0, 10)),
                   title_lable = "PDF of Exp(1) distribution")
p4<- plot_density(func_name = dchisq, para = list(df=5),
                  domain = data.frame(x = c(0, 10)),
                  title_lable = "PDF of Chisq distribution with df=5")

# put the four plots together 
grid.arrange(p1, p2, p3, p4, newpage = TRUE, 
             layout_matrix = matrix(1:4, byrow = TRUE, 2, 2))


