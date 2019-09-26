# UMR Microbiome Praktikum WS2019/20
Scripts and tutorials for analyzing microbiome data.

---

# Setup

## Software

- `pandaseq`: [Windows](https://github.com/neufeld/pandaseq/releases/download/v2.11/pandaseq-2.11.zip), [OSX](https://github.com/neufeld/pandaseq/releases/download/v2.11/PANDAseq-2.11.pkg). Install instructions [here](https://github.com/neufeld/pandaseq/wiki/Installation)
- `R`: [Windows](https://ftp.gwdg.de/pub/misc/cran/bin/windows/base/R-3.6.1-win.exe), [OSX](https://cran.rstudio.com/bin/macosx/R-3.6.1.pkg) 10.11+
- `RStudio`: [Windows 10/8/7](https://download1.rstudio.org/desktop/windows/RStudio-1.2.5001.exe) (64 bit), [OSX](https://download1.rstudio.org/desktop/macos/RStudio-1.2.5001.dmg) 10.12+, [Ubuntu](https://download1.rstudio.org/desktop/trusty/amd64/rstudio-1.2.5001-amd64.deb) 14

---

## R packages

```r
# ggplot2
install.packages("ggplot2")

# bioconductor
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()

# phyloseq
BiocManager::install("phyloseq")
```

---
Last update 2019/09/24


