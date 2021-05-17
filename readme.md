# The Fundamentals of Bayesian Data Analysis

Bayesian methods are now increasingly widely in data analysis across most
scientific research fields.  Given that Bayesian methods differ conceptually
and theoretically from their classical statistical counterparts that are
traditionally taught in statistics courses, many researchers do not have
opportunities to learn the fundamentals of Bayesian methods, which makes using
Bayesian data analysis in practice more challenging.  The aim of this course is
to provide a solid introduction to Bayesian methods, both theoretically and
practically.  We will teach the fundamental concepts of Bayesian inference and
Bayesian modelling, including how Bayesian methods differ from their classical
statistics counterparts, and show how to do Bayesian data analysis in practice
in R.  We begin with a gentle introduction to all the fundamental principles
and concepts of Bayesian methods: the likelihood function, prior distributions,
posterior distributions, high posterior density intervals, posterior predictive
distributions, marginal likelihoods, Bayesian model selection, etc.  We will do
this using some simple probabilistic models that are easy to understand and
easy to work with.  We then proceed to more practically useful Bayesian
analyses, specifically general linear models.  For these analyses, we will use
real world data sets, and carry out the analysis using the brms package in R,
which is an excellent and powerful package for Bayesian analysis.  In this
coverage, we will also provide a brief introduction to Markov Chain Monte Carlo
methods, although these will be described in more detail in subsequent Bayesian
data analysis courses.

## Intended Audience

This course is aimed at anyone who is interested to learn and apply Bayesian
data analysis in any area of science, including the social sciences, life
sciences, physical sciences. No prior experience or familiarity with Bayesian
statistics is required.

## Teaching Format

This course will be largely practical, hands-on, and workshop based. For many
topics, there will first be some lecture style presentation, i.e., using slides
or blackboard, to introduce and explain key concepts and theories. Then, we
will work with examples and perform the analyses using R. Any code that the
instructor produces during these sessions will be uploaded to a publicly
available GitHub site after each session.

The course will take place online using Zoom. On each day, the live video broadcasts will occur between (UK Local Time; UTC/GMT) at:

* 12pm-2pm
* 3pm-5pm
* 6pm-8pm

All the sessions will be video recorded, and made available as soon as possible after each 2hr session on a private video hosting website.

# Assumed quantitative knowledge

We assume familiarity with inferential statistics concepts like hypothesis testing and statistical significance, and some practical experience with commonly used methods like linear regression, correlation, or t-tests. Most or all of these concepts and methods are covered in a typical undergraduate statistics courses in any of the sciences and related fields.

## Assumed computer background

R experience is desirable but not essential. Although we will be using R extensively, all the code that we use will be made available, and so attendees will just need to copy and paste and add minor modifications to this code. Attendees should install R and RStudio and some R packages on their own computers before the workshops, and have some minimal familiarity with the R environment.

## Equipment and software requirements

A computer with a working version of R or RStudio is required. R and RStudio are both available as free and open source software for PCs, Macs, and Linux computers. In addition to R and RStudio, some R packages, particularly brms, are required. Instructions on how to install R/RStudio and all required R packages are [available here](software.md).


# Course programme

## Day 1

* Topic 1: We will begin with a overview of what Bayesian data analysis is in essence and how it fits into statistics as it practiced generally. Our main point here will be that Bayesian data analysis is effectively an alternative school of statistics to the traditional approach, which is referred to variously as the *classical*, or *sampling theory based*, or *frequentist* based approach, rather than being a specialized or advanced statistics topic. However, there is no real necessity to see these two general approaches as being mutually exclusive and in direct competition, and a pragmatic blend of both approaches is entirely possible.

* Topic 2: Introducing Bayes' rule. Bayes' rule can be described as a means to calculate the probability of causes from some known effects. As such, it can be used as a means for performing statistical inference. In this section of the course, we will work through some simple and intuitive calculations using Bayes' rule. Ultimately, all of Bayesian data analysis is based on an application of these methods to more complex statistical models, and so understanding these simple cases of the application of Bayes' rule can help provide a foundation for the more complex cases.

* Topic 3: Bayesian inference in a simple statistical model. In this section, we will work through a classic statistical inference problem, namely inferring the number of red marbles in an urn of red and black marbles, or equivalent problems. This problem is easy to analyse completely with just the use of R, but yet allows us to delve into all the key concepts of all Bayesian statistics including the likelihood function, prior distributions, posterior distributions, maximum a posteriori estimation, high posterior density intervals, posterior predictive intervals, marginal likelihoods, Bayes factors, model evaluation of out-of-sample generalization.


## Day 2

* Topic 4: Bayesian analysis of normal models. Statistical models based on linear and normal distribution are a mainstay of statistical analyses in general. They encompass models such as linear regression, Pearson's correlation, t-tests, ANOVA, ANCOVA, and so on. In this section, we will describe how to do Bayesian analysis of normal linear models, focusing on simple examples. One of the aims of this section is to identify some important and interesting parallels between Bayesian and classical or frequentist analyses. This shows how Bayesian and classical analyses can be seen as ultimately providing two different perspectives on the same problem.

* Topic 5: The previous section provides a so-called analytical approach to linear and normal models. This is where we can calculate desired quantities and distributions by way of simple formulae. However, analytical approaches to Bayesian analyses are only possible in a relatively restricted set of cases. On the other hand, numerical methods, specifically Markov Chain Monte Carlo (MCMC) methods can be applied to virtually any Bayesian model. In this section, we will re-perform the analysis presented in the previous section but using MCMC methods. For this, we will use the *brms* package in R that provides an exceptionally easy to use interface to Stan.
