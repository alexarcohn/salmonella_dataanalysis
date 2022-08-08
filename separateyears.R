# separateyears.R
# Alexa R. Cohn
# 25 Jan 2022

# read in dataset
enteritidis_chicken <- read.csv("~/Documents/Nidhi's project/enteritidis_chicken.csv")

# create datasets for each year
enteritidis_chicken_2016 <- subset(enteritidis_chicken, Collection.date == "2016", Organism.group:Strain)

# repeat for other years and other datasets
enteritidis_chicken_2017 <- subset(enteritidis_chicken, Collection.date == "2017", Organism.group:Strain)
enteritidis_chicken_2018 <- subset(enteritidis_chicken, Collection.date == "2018", Organism.group:Strain)
