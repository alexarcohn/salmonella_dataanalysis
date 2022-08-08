# chisquare.R
# perform chi square tests to determine association between two variables and perform post-hoc tests to determine significance
# Alexa R. Cohn
# 17 February 2022

# load packages
install.packages("corrplot")
library(corrplot)
library(tidyverse)

# load in data
chicken_ft <- read.csv("~/Documents/Nidhi's project/test.csv", 
                       header = TRUE, row.names = 1)
chicken_ggplot <- read.csv("~/Documents/Nidhi's project/test.csv", 
                           header = TRUE)

# convert data to a matrix
matrix <- as.matrix(chicken_ft)

# adjust data in order to plot
chicken_plots <- gather(chicken_ggplot, key = IsolationSource, value = Counts, Ground:Young.Chicken, factor_key = TRUE)
chicken_plots

# plot data
ggplot(data = chicken_plots, aes(x = Serovar, y = Counts, fill = IsolationSource)) +
  geom_bar(stat = "identity") +
  xlab("Serovar") +
  ylab("Number of Isolates")

# run chi square test
chi2 <- chisq.test(matrix)
chi2

# calculate standardized residuals
residuals <- chi2$stdres

# plot residuals
corrplot(chi2$residuals, is.cor = FALSE)

# if residual is <-2, that cell's observed frequency is less than the expected frequency.
# if the residual is >2, that cell's observed frequency is greater than the expected frequency.

# save data
write.csv(residuals, file = "~/Documents/Nidhi's project/FSIS_chicken_residuals.csv")
