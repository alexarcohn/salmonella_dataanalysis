# removefsisdata.R
# Alexa R. Cohn
# 25 Jan 2022

# read in dataset
enteritidis_cattle <- read.csv("~/Documents/Nidhi's project/enteritidis_cattle.csv")
# remove isolates containing FSIS identifiers
enteritidis_cattle <- enteritidis_cattle[grep("FSIS", enteritidis_cattle$Strain, invert = TRUE) , ]

# repeat for other serotypes and isolation sources
enteritidis_chicken <- read.csv("~/Documents/Nidhi's project/enteritidis_chicken.csv")
enteritidis_chicken <- enteritidis_chicken[grep("FSIS", enteritidis_chicken$Strain, invert = TRUE) , ]
