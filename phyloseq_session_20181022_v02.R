#!/usr/bin/env Rscript
# 2018-10-22
# phyloseq session

# detach if needed
# detach("package:phyloseq", unload=TRUE)
# detach("package:vegan", unload=TRUE)

# install "phyloseq" from Bioconductor if needed
source('http://bioconductor.org/biocLite.R') 
biocLite('phyloseq')

# install OLDER version of vegan to avoid error with 'distance' function
# ref https://github.com/joey711/phyloseq/issues/918
library(devtools)
install_version("vegan", version ="2.4-5")

# load vegan and phyloseq
library(vegan)
library(phyloseq)
# library(phyloseq, quietly = TRUE)

# input(s)
setwd("/Users/barrantes/Documents/courses/MicrobiomeWS201819/illuminadata")

# input filtered for low confidence otus, and with rarefaction
InputBiomFile <- "otu_table_high_conf_filtered.biom"

# map file
InputMapFile <- "mapping.tsv"

# prepare phyloseq object
BiomData <- import_biom(InputBiomFile, parseFunction = parse_taxonomy_greengenes)
SampleData <- import_qiime_sample_data(InputMapFile)

# create phyloseq object
ExperimentPhyloseqObject <- merge_phyloseq(BiomData, SampleData)

# Filtering out data
# 1. Prune OTUs that are not present in any of the samples 
ExperimentPhyloseqTempObject <- prune_taxa(taxa_sums(ExperimentPhyloseqObject) > 0, ExperimentPhyloseqObject)
# 2. Prune unidentified Genuses
ExperimentPhyloseqTempObject <-  subset_taxa(ExperimentPhyloseqTempObject, Genus   != "NA")
# 3. Filter out Eukaryotes, Archaea, chloroplasts and mitochondria
# ref http://deneflab.github.io/MicrobeMiseq/demos/mothur_2_phyloseq.html
ExperimentPhyloseqTempObject <-  subset_taxa(ExperimentPhyloseqTempObject, 
                                             Kingdom == "Bacteria" &
                                               Family  != "mitochondria" &
                                               Class   != "Chloroplast") 


# Calculate distance and ordination
iDist <- distance(ExperimentPhyloseqTempObject, method="bray")
iMDS  <- ordinate(ExperimentPhyloseqTempObject, distance=iDist)

# plot
plot_ordination(ExperimentPhyloseqTempObject, iMDS, color="Gender")

# plot with labels (requires ggplot2)
library(ggplot2, quietly = TRUE)
plot_ordination(ExperimentPhyloseqTempObject, iMDS, color="Gender") + 
  geom_text(aes(label=X.SampleID), hjust=0, vjust=0) 

# save plot as PDF
pdf("myplot.pdf")
plot_ordination(ExperimentPhyloseqTempObject, iMDS, color="Gender") + 
  geom_text(aes(label=X.SampleID), hjust=0, vjust=0) +
  labs(title = "Bacterial Communities in the Classroom",
       subtitle = "Sample ordination through Bray-Curtis distance") 
dev.off()

# Plot abundances
plot_bar(ExperimentPhyloseqTempObject, "X.SampleID", fill="Phylum")
# 'labs' requires ggplot2
plot_bar(ExperimentPhyloseqTempObject, "X.SampleID", fill="Phylum") +
  labs(title = "Bacterial Communities in the Classroom",
       subtitle = "Phylum Composition by sample; unknown genera not considered",
       x = "Sample", y = "Abundance\n") 

# Plot alpha diversities
plot_richness(ExperimentPhyloseqTempObject, "X.SampleID")
# color by gender
plot_richness(ExperimentPhyloseqTempObject, "X.SampleID", "Gender")
# using only two measures (requires ggplot2)
plot_richness(ExperimentPhyloseqTempObject, "X.SampleID", "Gender", measures=c("Chao1", "Fisher")) +
  labs(title = "Bacterial Communities in the Classroom",
       subtitle = "Phylum Composition by sample; unknown genera not considered",
       x = "Sample", y = "Alpha Diversity\n") 

# saving session
save.image("praktikum2018Okt.RData")



