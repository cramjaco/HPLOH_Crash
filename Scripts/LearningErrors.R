library(tidyverse)
library(dada2)
packageVersion("dada2")

files_to_filter <- read_csv("IntermediateData/files_for_learning_errors.csv")

nb = 1e8 # minimum number of bases
mt = TRUE
err_forward_all <- files_to_filter %>%
  group_by(Run) %>%
  nest() %>%
  mutate(err_forward = map(data,
                           ~learnErrors(.$FilteredPath_R1,
                                        nbases = nb,
                                        randomize = TRUE,
                                        multithread = mt))) %>%
  mutate(err_reverse = map(data, ~learnErrors(.$FilteredPath_R2,
                                              nbases = nb,
                                              randomize = TRUE,
                                              multithread = mt)))

save(files_to_filter, nb, err_forward_all, file = "IntermediateData/LearningErrorsResults.RData")