library(tidyverse)
library(dada2)
pass <- function(x){x}

source("PersonalLibraries/MetaCrashLibrary.R")


load("dada_all.RData")

# # Merging test
# 
# drp_fwd_tst <- dada_all[["derep_forward"]][[1]]
# drp_rev_tst <- dada_all[["derep_reverse"]][[1]]
# dad_fwd_tst <- dada_all[["dada_forward"]][[1]]
# dad_rev_tst <- dada_all[["dada_reverse"]][[1]]
# 
# mrg_tst <- mergePairs(dad_fwd_tst, drp_fwd_tst, dad_rev_tst, drp_rev_tst, returnRejects = TRUE)
# cat_tst <- mergePairs(dad_fwd_tst, drp_fwd_tst, dad_rev_tst, drp_rev_tst, justConcatenate  = TRUE)
# 
# mct_tst <- inconcat(mrg_tst[[1]], cat_tst[[1]])
# 
# 
# test_m1618 <- merge_16s18s(dad_fwd_tst, drp_fwd_tst, dad_rev_tst, drp_rev_tst)

# Merging all

merged_all <- dada_all %>%
  mutate(merged = pmap(
    .l = list(dada_forward, derep_forward, dada_reverse, derep_reverse),
    merge_16s18s
  ))

rm(dada_all)

save(merged_all, file = "IntermediateData/merged_all.Rdata")

st_all <- merged_all %>%
  select(Run, merged) %>%
  mutate(seqtab = map(merged, makeSequenceTable)) %>%
  select(-merged)

combined_seqtab <- mergeSequenceTables(tables = st_all$seqtab)

seqtab_nochim <- removeBimeraDenovo(combined_seqtab, verbose = T)

save(combined_seqtab, seqtab_nochim, file = "IntermediateData/seqtab_both.RData")

