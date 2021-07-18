library(tidyverse)
library(dada2)
pass <- function(x){x}

load("dada2_run_backup.RData")

mt = TRUE

dada_all <- derep_all %>%
  group_by(Run) %>% nest() %>%
  left_join(err_forward_all %>% select(-data), by = "Run") %>%
  mutate(derep_forward = map(data, ~.$derep_forward)) %>%
  mutate(derep_reverse = map(data, ~.$derep_reverse)) %>%
  mutate(dada_forward = map2(derep_forward, err_forward,
                             ~dada(.x, err = .y, pool = "pseudo", multithread = mt))) %>%
  mutate(dada_reverse = map2(derep_reverse, err_reverse,
                             ~dada(.x, err = .y, pool = "pseudo", multithread = mt))) %>%
  
  pass

save(dada_all, file = "dada_all.RData")
