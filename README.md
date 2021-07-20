# Horn Point Laboratory Oyster Hatchery Crash Pipeline

Processing of data for the paper:
Matthew W. Gray, Stephanie Alexander, Brian Beal, Tom Bliss, Colleen A. Burge, Jacob Cram, Michael De Luca, James Dumhart, Patricia M. Glibert, Michael Gonsior, Andrew Heyes, Klaus Huebert, Vyacheslav Lyubchich, Matt Parker, Louis Plough, Eric Schott, Lisa Wainger, Ami Wilbur. 2021. Hatchery crashes among shellfish research hatcheries along the Atlantic coast of the United States: a case study at Horn Point Laboratory oyster hatchery. Aquaculture (Manuscript#: AQUACULTURE-D-21-01351R1)

Methods are described in the manuscript supplement: In brief, larvae were collected from experiments adjacent to the HPL larval hatchery. In both cases a wild type strain and non wild type strain (NEH in the crash experiment, AQUA/LOLA in the case of the non-crash experiment) of larvae were either starved, or not starved, in triplicate tanks. In one experiment in , all larvae died, concurrently with an ongoing crash in the hatchery. In the other, no larvae died. -- Larvae were 7 (crash) and 5 (non-crash) days old at the "pre" time point. During the Starved and Fed time-points in the crash group they were 12 days old. During the Fed and Starved non-crash time-points they were 8 days old. -- Samples were extracted with SDS, heating and bead-beeting, followed by protinase K incubation. Samples were washed with phenol-chlorophorm three times, precipitated with isopropanol and ammonium acitate, rinsed with ethanol and re-suspended in a Tris-EDTA solution. Amplicon library prep and sequencing was carried out by the Institute for Marine and Enviornmental Technologies' Bioanalytical Services Laboratory (IMET-BASLab). The Crashed samples, run after a laboratory shutdown following the 2020 pandemic, were initially of low quaity and had to be re-run three additional times. The data presented here are from the best, fourth, run.

Samples are on SRA corresponding to bioproject PRJNA744562.

Running files in the following order should reproduce the analysis.

Data can be pulled by running

`sh PullFastqFromSRA.sh`

For taxonomic assignment, please also pull the taxonomy file with
`sh PullSilvaData.sh`


Most remaining steps are carried out in the R markdown file 
`InitialProcessing.Rmd`

Package managment is provided by the `renv` library, which should install software automatically when you first load R in this directory. However, if that doesn't happen, you may need to install renv and then run `renv::restore()`

The script generates some text files that tells which files are which and are usefull in some of the other functions. It uses bash code blocks to run some scripts from the command line, including R scripts.

Finally one can run 
`SecondaryProcessingAndAnalysis.Rmd` 
This re-generates the figure from the manuscript, and all analyses cited therein.