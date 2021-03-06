library(tidyverse)
library(dada2)
packageVersion("dada2")
set.seed(33100)

load("IntermediateData/LearningErrorsResults.RData")

derep_all <- files_to_filter %>%
  mutate(derep_forward = derepFastq(FilteredPath_R1, verbose = TRUE)) %>%
  mutate(derep_reverse = derepFastq(FilteredPath_R2, verbose = TRUE))

save.image("IntermediateData/dada2_run_backup.RData")

# 03 March 2020 -- Screwed up reverse reads, they are the same as the forwards.