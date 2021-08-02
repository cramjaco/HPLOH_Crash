# Horn Point Laboratory Oyster Hatchery Crash Pipeline

## Citation
Processing of data for the paper:
Matthew W. Gray, Stephanie Alexander, Brian Beal, Tom Bliss, Colleen A. Burge, Jacob Cram, Michael De Luca, James Dumhart, Patricia M. Glibert, Michael Gonsior, Andrew Heyes, Klaus Huebert, Vyacheslav Lyubchich, Matt Parker, Louis Plough, Eric Schott, Lisa Wainger, Ami Wilbur. 2021. Hatchery crashes among shellfish research hatcheries along the Atlantic coast of the United States: a case study at Horn Point Laboratory oyster hatchery. Aquaculture (Manuscript#: AQUACULTURE-D-21-01351R1)


## Methods in Brief
Methods are described in the manuscript supplement: In brief, larvae were collected from experiments adjacent to the HPL larval hatchery. In both cases a wild type strain and non wild type strain (NEH in the crash experiment, AQUA/LOLA in the case of the non-crash experiment) of larvae were either starved, or not starved, in triplicate tanks. In one experiment in , all larvae died, concurrently with an ongoing crash in the hatchery. In the other, no larvae died. -- Larvae were 7 (crash) and 5 (non-crash) days old at the "pre" time point. During the Starved and Fed time-points in the crash group they were 12 days old. During the Fed and Starved non-crash time-points they were 8 days old. -- Samples were extracted with SDS, heating and bead-beating, followed by protinase K incubation. Samples were washed with phenol-chloroform three times, precipitated with isopropanol and ammonium acetate, rinsed with ethanol and re-suspended in a Tris-EDTA solution. Amplicon library prep and sequencing was carried out by the Institute for Marine and Environmental Technologies' Bioanalytical Services Laboratory (IMET-BASLab). The Crashed samples, run after a laboratory shutdown following the 2020 pandemic, were initially of low quality and had to be re-run three additional times. The data presented here are from the best, fourth, run.

Samples are on SRA corresponding to bioproject PRJNA744562.

## Analytical pipeline
In principal all steps can be run by running two R markdown files.

Processing steps, including fetching data can all be run by running
`InitialProcessing.Rmd`

Finally one can run 
`SecondaryProcessingAndAnalysis.Rmd` 
This re-generates the figure from the manuscript, and all analyses cited therein.

## Dependencies
I have only run these scripts in Ubuntu Linux 18.04.

packages are all run our of `R` Version 3.6.3

`cutadapt` in python is required to remove primers from the sequences. I have best luck crating this in a condas environment, and then running the rstudio document in that environment.

`fastq-dump` is required to fetch the sequences from sequence read archive

Package managment is provided by the `renv` library, which should install software automatically when you first load R in this directory. However, if that doesn't happen, you may need to install renv and then run `renv::restore()`

The script generates some text files that tells which files are which and are usefull in some of the other functions. It uses bash code blocks to run some scripts from the command line, including R scripts.


All of the other files are generated by the above four scripts, and will be overwritten if you run those scripts in order.
The fastq files are large and so not included in the shared version of this directory. However, running these scripts will generate those files. 

Please see the sessionInfo dump at the bottom of this README for more details about my environment.

## Processed data
A list of sequences can be found at `ASVs.fa`.
A count table can be found at `ASVs_counts.tsv`
A taxonomy table is available at `ASVs_taxonomy.tsv`
Sample data can be found in the files `sample_data.csv` and `keyA3.csv`

## Output of sessioninfo under InitialProcessing.Rmd

Show in New WindowClear OutputExpand/Collapse Output
R version 3.6.3 (2020-02-29)
Platform: x86_64-pc-linux-gnu (64-bit)
Running under: Ubuntu 18.04.5 LTS

Matrix products: default
BLAS:   /usr/lib/x86_64-linux-gnu/blas/libblas.so.3.7.1
LAPACK: /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.7.1

locale:
 [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
 [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
 [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
 [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
 [9] LC_ADDRESS=C               LC_TELEPHONE=C            
[11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       

attached base packages:
[1] stats     graphics  grDevices datasets  utils     methods   base     

other attached packages:
 [1] dada2_1.20.0    Rcpp_1.0.7      forcats_0.5.1   stringr_1.4.0  
 [5] dplyr_1.0.7     purrr_0.3.4     readr_1.4.0     tidyr_1.1.3    
 [9] tibble_3.1.2    ggplot2_3.3.5   tidyverse_1.3.1

loaded via a namespace (and not attached):
 [1] Biobase_2.46.0              httr_1.4.2                 
 [3] jsonlite_1.7.2              modelr_0.1.8               
 [5] RcppParallel_5.1.4          assertthat_0.2.1           
 [7] BiocManager_1.30.16         stats4_3.6.3               
 [9] latticeExtra_0.6-29         renv_0.13.2                
[11] GenomeInfoDbData_1.2.2      cellranger_1.1.0           
[13] Rsamtools_2.2.3             pillar_1.6.1               
[15] backports_1.2.1             lattice_0.20-44            
[17] glue_1.4.2                  RColorBrewer_1.1-2         
[19] GenomicRanges_1.38.0        XVector_0.26.0             
[21] rvest_1.0.0                 colorspace_2.0-2           
[23] plyr_1.8.6                  Matrix_1.3-4               
[25] pkgconfig_2.0.3             broom_0.7.8                
[27] ShortRead_1.44.3            haven_2.4.1                
[29] zlibbioc_1.32.0             scales_1.1.1               
[31] jpeg_0.1-8.1                BiocParallel_1.20.1        
[33] generics_0.1.0              IRanges_2.20.2             
[35] ellipsis_0.3.2              withr_2.4.2                
[37] SummarizedExperiment_1.16.1 BiocGenerics_0.32.0        
[39] cli_3.0.1                   magrittr_2.0.1             
[41] crayon_1.4.1                readxl_1.3.1               
[43] fs_1.5.0                    fansi_0.5.0                
[45] xml2_1.3.2                  hwriter_1.3.2              
[47] tools_3.6.3                 hms_1.1.0                  
[49] lifecycle_1.0.0             matrixStats_0.59.0         
[51] S4Vectors_0.24.4            munsell_0.5.0              
[53] reprex_2.0.0                DelayedArray_0.12.3        
[55] Biostrings_2.54.0           compiler_3.6.3             
[57] GenomeInfoDb_1.22.1         rlang_0.4.11               
[59] grid_3.6.3                  RCurl_1.98-1.3             
[61] rstudioapi_0.13             bitops_1.0-7               
[63] gtable_0.3.0                DBI_1.1.1                  
[65] reshape2_1.4.4              R6_2.5.0                   
[67] GenomicAlignments_1.22.1    lubridate_1.7.10           
[69] knitr_1.33                  utf8_1.2.1                 
[71] stringi_1.7.3               parallel_3.6.3             
[73] png_0.1-7                   vctrs_0.3.8                
[75] dbplyr_2.1.1                tidyselect_1.1.1           
[77] xfun_0.24    

# Ibid on SecondaryProcessingAndAnalysis
