# Microbiome Setup WS2019/20

## Software

- `pandaseq`: [Windows](https://github.com/neufeld/pandaseq/releases/download/v2.11/pandaseq-2.11.zip), [OSX](https://github.com/neufeld/pandaseq/releases/download/v2.11/PANDAseq-2.11.pkg). Install instructions [here](https://github.com/neufeld/pandaseq/wiki/Installation)
- `R`: [Windows](https://ftp.gwdg.de/pub/misc/cran/bin/windows/base/R-3.6.1-win.exe), [OSX](https://cran.rstudio.com/bin/macosx/R-3.6.1.pkg) 10.11+
- `RStudio`: [Windows 10/8/7](https://download1.rstudio.org/desktop/windows/RStudio-1.2.5001.exe) (64 bit), [OSX](https://download1.rstudio.org/desktop/macos/RStudio-1.2.5001.dmg) 10.12+, [Ubuntu](https://download1.rstudio.org/desktop/trusty/amd64/rstudio-1.2.5001-amd64.deb) 14

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

# OSX: Applications / TextEdit
```
### R packages

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


