library(dada2)
library(tidyverse)
library(phyloseq)
library(seqinr)

load("sequence_table_and_taxa.RData")

# giving our seq headers more manageable names (ASV_1, ASV_2...)
asv_seqs <- colnames(seqtab_nochim)
asv_headers <- vector(dim(seqtab_nochim)[2], mode = "character")

for (i in 1:dim(seqtab_nochim)[2]) {
  asv_headers[i] <- paste("ASV", i, sep="_")
}

# making and writing out a fasta of our final ASV seqs:
seqinr::write.fasta(sequences = as.list(asv_seqs), names = asv_headers, file.out = "ASVs.fa")

# and a table of sequences
asv_seqs_tib <- tibble(asv = asv_headers, seqs = asv_seqs)
write_csv(asv_seqs_tib, "asv_seqs.csv")

moo <- read.fasta("ASVs.fa")
#write(asv_fasta, "ASVs.fa")

  # count table:
asv_tab <- t(seqtab_nochim)
colnames(asv_tab) <- colnames(asv_tab) %>% str_remove("_R1_filtered.fastq.gz")

row.names(asv_tab) <- sub(">", "", asv_headers)
write.table(asv_tab, "ASVs_counts.tsv", sep="\t", quote=F, col.names=NA)

  # tax table:
asv_tax <- taxa
row.names(asv_tax) <- sub(">", "", asv_headers)

write.table(asv_tax, "ASVs_taxonomy.tsv", sep="\t", quote=F, col.names=NA)
