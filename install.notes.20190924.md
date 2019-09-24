## Software

- Pandaseq: [Windows](https://github.com/neufeld/pandaseq/releases/download/v2.11/pandaseq-2.11.zip), [OSX](), [Linux]()
- R [Windows](https://ftp.gwdg.de/pub/misc/cran/bin/windows/base/R-3.6.1-win.exe), [OSX](), [Linux]()
- RStudio [Windows](https://download1.rstudio.org/desktop/windows/RStudio-1.2.5001.exe), [OSX](), [Linux]()

### `pandaseq` test run

```bash
# Windows: Start / type 'cmd'
# $ d:
# $ cd mikrobiome2019\panda

# OSX: Applications / Utilities / Terminal

# test program and see options
$ pandaseq -h
# run with test data
$ pandaseq -f F3D0_S188_L001_R1_001.fastq -r F3D0_S188_L001_R2_001.fastq -w output.fasta
# ready in ~2 min

# windows start / type 'notepad'
# 'Datei / Offnen, select 'Alle Dateien'
# open 'output.fasta'
```
### Setup R packages

```r
# ggplot2 (plotting)
install.packages("ggplot2")

# bioconductor
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()

# phyloseq
BiocManager::install("phyloseq")
```

### Test R session

```r
# test session

library(phyloseq)

# OSX/Linux
# setwd("~/Documents/courses/MicrobiomeWS201819/illuminadata")

# windows version
setwd("D:/mikrobiome2019")

# OTU BIOM file
InputBiomFile <- "otu_table_high_conf_json.biom"

# Sample (map) file
InputMapFile <- "mapping.tsv"

# then continue as in the old Rscript
```

---
Last update 2019/09/24


