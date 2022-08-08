# fisher tests for overrepresentation of serovars
# Alexa R Cohn
# 17 Jan 2022

# load in data
chicken <- read.csv("~/Documents/Nidhi's project/Chicken.csv")

## add in columns for odds ratios and p values
chicken$OR <-  NA
chicken$pvalue <-  NA

## create vectors with number of isolates per category
NCBI_counts <- sum(chicken$NCBI)
FSIS_counts <- sum(chicken$FSIS)

# Loop over all HDCs.
for (i in 1:nrow(chicken)) {
  # For each isolate type, get the counts associated with serovar i.
  NCBI_counts_in = chicken$NCBI[i]
  FSIS_counts_in = chicken$FSIS[i]
  # For each isolate type, get the counts that does not belong to serovar i.
  NCBI_counts_out = NCBI_counts - NCBI_counts_in
  FSIS_counts_out = FSIS_counts - FSIS_counts_in
  
  # Calculate the odds ratio for
  oddsratio = (NCBI_counts_in/FSIS_counts_in)/(NCBI_counts_out/FSIS_counts_out)
  
  # Create 2*2 table of Fisher's test
  fetb <- matrix(rep(NA, 4), nrow = 2)
  colnames(fetb) <- c("NCBI", "FSIS")
  rownames(fetb) <- c("serovar", "other")
  fetb[1,1] <- NCBI_counts_in
  fetb[1,2] <- FSIS_counts_in
  fetb[2,1] <- NCBI_counts_out
  fetb[2,2] <- FSIS_counts_out
  
  # Fisher's test
  if (is.na(oddsratio)) {
    pvalue <- 'Both serovar and other have 0 counts'
  } else {
    results <- fisher.test(fetb, alternative = "less")
    pvalue <- results$p.value
  }
  
  # Fill in the odds ratios and unadjusted P-values.
  chicken$OR[i] <- oddsratio
  chicken$pvalue[i] <- pvalue
  
  
}

write.csv(chicken, "~/Documents/Nidhi's project/fishertest_chicken.csv")
