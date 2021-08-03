library(dada2)
library(tidyverse)
set.seed(33100)
# Check for primer problems
load("IntermediateData/seqtab_both.RData")
sum(seqtab_nochim)/sum(combined_seqtab)
# 0.9989
# those are remarkably few chimeras
# This was also a lot faster than I expected

#seqtab_nochim_2 <- removeBimeraDenovo(seqtab_nochim, verbose = T)
#sum(seqtab_nochim_2)/sum(combined_seqtab)

taxa <- assignTaxonomy(seqtab_nochim, "Reference/silva_nr_v132_train_set.fa.gz",
                       tryRC=T,
                       multithread = TRUE)

save(seqtab_nochim, taxa, file = "IntermediateData/sequence_table_and_taxa.RData")



