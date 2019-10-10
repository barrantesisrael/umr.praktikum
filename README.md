# UMR Microbiome Praktikum WS2019/20

Scripts and tutorials for analyzing microbiome data. Lab practice for [Moderne molekulare und Hochdurchsatz-Technologien in der medizinischen Grundlagenforschung](https://lsf.uni-rostock.de/qisserver/rds;jsessionid=BB8A59F014D3F7C41005016CB244C476.node2?state=verpublish&status=init&vmfile=no&moduleCall=webInfo&publishConfFile=webInfo&publishSubDir=veranstaltung&navigationPosition=lectures%2Csearch&breadcrumb=searchLectures&topitem=lectures&subitem=search&veranstaltung.veranstid=115284)

---

## Description

These sessions will cover the use of a variety of software tools needed for the analysis of microbiome data, from the handling of the Illumina sequencing data, to the processing of 16S rRNA amplicon data. During these sessions, the students will be able to:

* Evaluate the quality of an Illumina sequencing run, including data filtering;
* Carry out assemblies of 16S rRNA amplicons;
* Learn the basics on the R programming language and environment; and 
* State how to manipulate microbiome data including count tables and sample metadata. 

##### Venue and Dates

[IBIMA](https://ibima.med.uni-rostock.de) Computerraum ([Ernst-Heydemann-Str. 8](https://goo.gl/maps/JGDWhPDLHxG2), 3. Etage, Nr. 3016) <br>
16.10 and 23.10.2019, 10:00 - 11:30 hrs.


---

## Setup

##### Software

- `pandaseq`: [Windows](https://github.com/neufeld/pandaseq/releases/download/v2.11/pandaseq-2.11.zip), [OSX](https://github.com/neufeld/pandaseq/releases/download/v2.11/PANDAseq-2.11.pkg). Install instructions [here](https://github.com/neufeld/pandaseq/wiki/Installation)
- `R`: [Windows](https://ftp.gwdg.de/pub/misc/cran/bin/windows/base/R-3.6.1-win.exe), [OSX](https://cran.rstudio.com/bin/macosx/R-3.6.1.pkg) 10.11+
- `RStudio`: [Windows 10/8/7](https://download1.rstudio.org/desktop/windows/RStudio-1.2.5001.exe) (64 bit), [OSX](https://download1.rstudio.org/desktop/macos/RStudio-1.2.5001.dmg) 10.12+, [Ubuntu](https://download1.rstudio.org/desktop/trusty/amd64/rstudio-1.2.5001-amd64.deb) 14. 

_Note_: There are **no** 32-bit versions of RStudio. In this case, students can use one of the few PCs in the Computer Room that have already RStudio installed.

---

##### R packages

To be installed during the lab sessions:

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

## Materials

##### Online tools

* European [Galaxy mirror](https://usegalaxy.eu)
* [RDP Aligner](https://pyro.cme.msu.edu/aligner/form.spr)
* [RDP Complete Clustering](https://pyro.cme.msu.edu/cluster/form.spr) tool

##### Data

- Illumina data: [cloud drive](https://drive.google.com/drive/folders/1QtxFK-2UPxlSLwOA4rQByOMHY7LUF7Fr?usp=sharing); see `FASTQ` folder.
- Alternatively, the course can be also followed using the [MiSeq SOP](http://www.mothur.org/w/images/d/d6/MiSeqSOPData.zip) FASTQ files.

---

## Bibliography

* Afgan E et al. (2018). The Galaxy platform for accessible, reproducible and collaborative biomedical analyses: 2018 update. Nucleic Acids Research, 46(W1), W537-W544. https://doi.org/10.1093/nar/gky379
* Callahan BJ et al. (2016). Bioconductor workflow for microbiome data analysis: from raw reads to community analyses. F1000Research, 5, 1492. https://doi.org/10.12688/f1000research.8986.1
* Cole JR et al. (2014). Ribosomal Database Project: data and tools for high throughput rRNA analysis. Nucleic Acids Research, 42(D1), D633–D642. https://doi.org/10.1093/nar/gkt1244
* Comeau AM et al. (2017). Microbiome Helper: a Custom and Streamlined Workflow for Microbiome Research. mSystems 2(1): e00127-16; DOI:10.1128/mSystems.00127-16
* Gentleman RC et al. (2004). Bioconductor: open software development for computational biology and bioinformatics. Genome Biology, 5(10), R80. https://doi.org/10.1186/gb-2004-5-10-r80
* Goodrich JKK et al. (2014). Conducting a Microbiome Study. Cell, 158(2), 250–262. https://doi.org/10.1016/j.cell.2014.06.037
* Knight R et al. (2018). Best practices for analysing microbiomes. Nature Reviews Microbiology, 16, 410–422. https://doi.org/10.1038/s41579-018-0029-9
* Masella AP et al. (2012). PANDAseq: Paired-end assembler for illumina sequences. BMC Bioinformatics, 13(1), 31. https://doi.org/10.1186/1471-2105-13-31
* McDonald D et al. (2012). The Biological Observation Matrix (BIOM) format or: how I learned to stop worrying and love the ome-ome. GigaScience, 1(1), 7. https://doi.org/10.1186/2047-217X-1-7
* McMurdie PJ and Holmes S. (2013). Phyloseq: An R Package for Reproducible Interactive Analysis and Graphics of Microbiome Census Data. PLoS ONE, 8(4), e61217. https://doi.org/10.1371/journal.pone.0061217


---

## Contact

Dr. rer. nat. Israel Barrantes <br>
Institute for Biostatistics and Informatics in Medicine and Ageing Research, Office 3017<br>
Rostock University Medical Center<br>
Ernst-Heydemann-Str. 8<br>
18057 Rostock, Germany<br>

Email: israel.barrantes[at]uni-rostock.de

---
Last update 2019/10/10


