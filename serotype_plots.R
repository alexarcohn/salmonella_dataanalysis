# Plotting serotype prevalence
# Alexa R. Cohn
# 25 Jan 2022

# load tidyverse
library(tidyverse)

# load dataset
chicken <- read.csv("~/Documents/Nidhi's Project/chicken.csv")

# plot NCBI vs. FSIS data to visualize
ggplot(chicken, aes(x = NCBI, y = FSIS)) +
  geom_point(size = 2) +
  geom_text(label = chicken$Serovar)

# separate NCBI and FSIS data into separate data frames
NCBI <- chicken[, c(1,2)]
FSIS <- chicken[, c(1,3)]

# calculate percentages of each serotype
NCBI_sum <- sum(NCBI$NCBI) 
NCBI$percent <- NCBI$NCBI / NCBI_sum
NCBI$labels <- scales::percent(NCBI$percent)

FSIS_sum <- sum(FSIS$FSIS)
FSIS$percent <- FSIS$FSIS / FSIS_sum
FSIS$labels <- scales::percent(FSIS$percent)

# plot pie charts
NCBI_pie <- ggplot(NCBI, aes(x = "", y = percent, fill = Serovar)) +
  geom_col(color="black") +
  coord_polar(theta = "y") +
  theme_void() +
  ggtitle("Serotype Prevalence in Chicken Samples from NCBI")
NCBI_pie

FSIS_pie <- ggplot(FSIS, aes(x = "", y = percent, fill = Serovar)) +
  geom_col(color = "black") +
  coord_polar(theta = "y") +
  theme_void() +
  ggtitle("Serotype Prevalence in Chicken Samples from USDA-FSIS")
FSIS_pie
