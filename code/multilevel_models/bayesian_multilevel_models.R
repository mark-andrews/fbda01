library(lme4)
library(MCMCglmm)

pitch.df <- read.csv('pitch.csv', header=T)

participant <- pitch.df$Participant
pitch <- pitch.df$pitch
base <- pitch.df$base
attract <- pitch.df$attract
face <- pitch.df$Face

N <- length(participant)
J <- max(participant)
K <- max(face)

n.iter <- 50000

### Model 1: pitch ~ 1 + (1|Participant) ###

M.1.lmer <- lmer(pitch ~ 1 + (1|Participant), pitch.df)


pitch.mcmc.1 <- MCMCglmm(pitch ~ 1, 
                         random= ~ Participant, 
                         nitt=n.iter, 
                         data=pitch.df)

summary(M.1.lmer)
summary(pitch.mcmc.1)

### Model 2: pitch ~ base + (1|Participant) ###

M.2.lmer <- lmer(pitch ~ base + (1|Participant), pitch.df)

pitch.mcmc.2 <- MCMCglmm(pitch ~ base, 
                         random= ~ Participant, 
                         nitt=n.iter, 
                         data=pitch.df)

summary(M.2.lmer)
summary(pitch.mcmc.2)

### Model 3: pitch ~ base + attract + (1|Participant) ###

M.3.lmer <- lmer(pitch ~ base + attract + (1|Participant), pitch.df)
pitch.mcmc.3 <- MCMCglmm(pitch ~ base + attract, 
                         random= ~ Participant, 
                         nitt=n.iter, 
                         data=pitch.df)

summary(M.3.lmer)
summary(pitch.mcmc.3)

### Model 4: pitch ~ base + attract + (attract|Participant) ###

M.4.lmer <- lmer(pitch ~ base + attract + (attract|Participant), pitch.df)
pitch.mcmc.4 <- MCMCglmm(pitch ~ base + attract, 
                         random= ~ idh(1+attract):Participant, 
                         nitt=n.iter, 
                         data=pitch.df)

summary(M.4.lmer)

summary(pitch.mcmc.4)

### Model 5: pitch ~ base + attract + (1|Participant) + (1|Face) ###
M.5.lmer <- lmer(pitch ~ base + attract + (1|Participant) + (1|Face), data=pitch.df)
pitch.mcmc.5 <- MCMCglmm(pitch ~ base + attract, 
                         random= ~ Participant + Face, 
                         nitt=n.iter, 
                         data=pitch.df)

### Model 6: pitch ~ base + attract + (attract|Participant) + (1|Face) ###
M.6.lmer <- lmer(pitch ~ base + attract + (attract|Participant) + (1|Face), data=pitch.df)
pitch.mcmc.6 <- MCMCglmm(pitch ~ base + attract, 
                         random= ~ idh(1+attract):Participant + Face, 
                         nitt=n.iter, 
                         data=pitch.df)

### Model 7: pitch ~ base + attract + (base + attract|Participant) + (1|Face) ###
M.7.lmer <- lmer(pitch ~ base + attract + (attract+base|Participant) + (1|Face), data=pitch.df)
M.7.lmer <- lmer(pitch ~ base + attract 
                 + (1|Participant) 
                 + (0+ base|Participant) 
                 + (0+ attract|Participant) 
                 + (0 + attract : base|Participant) 
                 + (1|Face), data=pitch.df)

pitch.mcmc.7 <- MCMCglmm(pitch ~ base + attract, 
                         random= ~ idh(1 + base+attract):Participant + Face, 
                         nitt=n.iter, 
                         data=pitch.df)
