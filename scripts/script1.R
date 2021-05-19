#https://notebooks.gesis.org/binder/v2/gh/mark-andrews/hellobinder-rstan/HEAD?urlpath=rstudio


# Install "prior exposure" package (if possible) --------------------------

# Usually no need to update your packages if/when asked at this stage
devtools::install_git("https://github.com/mark-andrews/fbda01.git", 
                      subdir = "priorexposure")
library(priorexposure)

# If any problems occurred above, then you can just "source" the relevant file
# which is on GitHub

source("https://raw.githubusercontent.com/mark-andrews/fbda01/master/priorexposure/R/bernoulli_models.R")


# Plot a likelihood function ----------------------------------------------

# this is for the binomial/bernoulli problem
# the first value is the sample size, number of 
bernoulli_likelihood(50, 20)

beta_plot(3, 5)
beta_plot(10, 3)
beta_plot(1, 5)
beta_plot(5, 2)
beta_plot(50, 20)
beta_plot(1, 1)
beta_plot(1.1, 1.1)
beta_plot(2, 2)
beta_plot(20, 20)
beta_plot(0.1, 0.1)

m <- 139 # number of Heads
n <- 250 # number of flips
# and if we assume a flat/uniform beta prior
beta_plot(m + 1, n - m + 1)

bernoulli_posterior_summary(n, m, 1, 1)

get_beta_hpd(m + 1, n - m + 1)
