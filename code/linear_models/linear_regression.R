library(ggplot2)
library(MCMCpack)

load('beautyeval.Rda')

# Visualize it
ggplot(beautydata,
       mapping=aes(x=beauty, y=eval, col=sex)) + 
  geom_point() +
  geom_smooth(method='lm') +
  xlab('Lecturer attractiveness') +
  ylab('Teaching evaluation score') +
  ggtitle('Do good looking lecturers get better teaching evaluation score?') +
  theme_classic()


# Classical lm
M_lm <- lm(eval ~ beauty*sex, 
           data=beautydata)

# Linear model with MCMCregress
# based on default priors
M_bayes <- MCMCregress(eval ~ beauty*sex, 
                       data=beautydata)

summary(M_bayes)
plot(M_bayes)
HPDinterval(M_bayes)
raftery.diag(M_bayes)
effectiveSize(M_bayes)


#########


set.seed(1001)

n <- 100
x1 <- rnorm(n)
x2 <- rnorm(n)

sigma <- 1.75
b0 <- 1.25
b1 <- 2.25
b2 <- -1.25

y <- b0 + b1*x1 + b2*x2 + rnorm(n, sd=sigma)

S <- MCMCregress(y ~ x1 + x2, burnin=1000, mcmc=10000, thin=10)
plot(S)

S <- MCMCregress(y ~ x1 + x2, burnin=1000, mcmc=10000, thin=10, 
                 b0=c(0,0,0), B0=c(.01, .01, .01), marginal.likelihood='Chib95')

S_null <- MCMCregress(y ~ x1, burnin=1000, mcmc=10000, thin=10, 
                 b0=c(0,0), B0=c(.01, .01), marginal.likelihood='Chib95')


M <- BayesFactor(S, S_null)

