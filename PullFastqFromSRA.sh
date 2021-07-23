cat IntermediateData/SRR_Acc_List.txt | xargs fastq-dump --split-files --gzip --outdir SRA_Readfiles {}
