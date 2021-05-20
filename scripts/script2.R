library(tidyverse)
library(brms)

set.seed(10101) # Omit or change this if you like

N <- 25

x_1 <- rnorm(N)
x_2 <- rnorm(N)

beta_0 <- 1.25
beta_1 <- 1.75
beta_2 <- 2.25

mu <- beta_0 + beta_1 * x_1 + beta_2 * x_2

y <- mu + rnorm(N, mean=0, sd=1.75)

Df <- tibble(x_1, x_2, y)

# Linear model, the traditional way
M_lm <- lm(y ~ x_1 + x_2, data = Df)
summary(M_lm)

M_brm <- brm(y ~ x_1 + x_2, data = Df)
M_brm

plot(M_brm)
prior_summary(M_brm)

M_brm2 <- brm(y ~ x_1 + x_2, 
              data = Df,
              chains = 4,
              cores = 4,
              iter = 2500,
              warmup = 500,
              prior = set_prior('normal(0, 100)'),
              seed = 10101)

M_brm3 <- brm(y ~ x_1, 
              data = Df,
              chains = 4,
              cores = 4,
              iter = 2500,
              warmup = 500,
              prior = set_prior('normal(0, 100)'),
              seed = 10101)

waic(M_brm2)
waic(M_brm3)
loo(M_brm2)
loo(M_brm3)
