library(seqinr)
library(phyloseq)
library(readr)

counts <- read.table("ASVs_counts.tsv", sep="\t", header = TRUE, row.names = 1)
taxa <- read.table("ASVs_taxonomy.tsv", sep="\t", header = TRUE, row.names = 1)
sequences <- read.fasta("ASVs.fa", as.string = TRUE, forceDNAtolower = FALSE)
samples <- read.csv("sample_data.csv", row.names = 1, header = TRUE)
samples$SampleID = rownames(samples)


ot <- otu_table(counts, taxa_are_rows = TRUE) 
tt <- tax_table(as.matrix(taxa))
sd <- sample_data(samples)

ps <- phyloseq(
  ot, 
  tt,
  sd
)

save(ps, file = "larval_phyloseq.RData")
