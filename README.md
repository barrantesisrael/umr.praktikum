# UMR Microbiome Praktikum WS2019/20

Scripts and tutorials for analyzing microbiome data. Lab practice for the lecture: [Moderne molekulare und Hochdurchsatz-Technologien in der medizinischen Grundlagenforschung](https://lsf.uni-rostock.de/qisserver/rds;jsessionid=BB8A59F014D3F7C41005016CB244C476.node2?state=verpublish&status=init&vmfile=no&moduleCall=webInfo&publishConfFile=webInfo&publishSubDir=veranstaltung&navigationPosition=lectures%2Csearch&breadcrumb=searchLectures&topitem=lectures&subitem=search&veranstaltung.veranstid=115284)

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

## Materials and online methods

##### Tools

* [Galaxy](https://usegalaxy.org) project mirror
* [RDP Classifier webserver](http://rdp.cme.msu.edu/classifier/classifier.jsp)

##### Data

- Illumina data: [cloud drive](https://drive.google.com/drive/folders/1QtxFK-2UPxlSLwOA4rQByOMHY7LUF7Fr?usp=sharing); see `FASTQ` folder.
- Alternatively, the course can be also followed using the [MiSeq SOP](http://www.mothur.org/w/images/d/d6/MiSeqSOPData.zip) FASTQ files (Kosich et al., 2013).

---

## Session 1: Setup

##### Software

- `pandaseq`: [Windows](https://github.com/neufeld/pandaseq/releases/download/v2.11/pandaseq-2.11.zip), [OSX](https://github.com/neufeld/pandaseq/releases/download/v2.11/PANDAseq-2.11.pkg). Install instructions [here](https://github.com/neufeld/pandaseq/wiki/Installation)
- `R`: [Windows](https://ftp.gwdg.de/pub/misc/cran/bin/windows/base/R-3.6.1-win.exe), [OSX](https://cran.rstudio.com/bin/macosx/R-3.6.1.pkg) 10.11+
- `RStudio`: [Windows 10/8/7](https://download1.rstudio.org/desktop/windows/RStudio-1.2.5001.exe) (64 bit), [OSX](https://download1.rstudio.org/desktop/macos/RStudio-1.2.5001.dmg) 10.12+, [Ubuntu](https://download1.rstudio.org/desktop/trusty/amd64/rstudio-1.2.5001-amd64.deb) 14. 
- _Optional_ `FastQC`: [Windows/Linux zip file](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip); Mac [DMG image](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.dmg)

_Note_: There are **no** 32-bit versions of RStudio. In this case, students can use one of the few PCs in the Computer Room that have already RStudio installed.


---

## Session 2

##### Quality control with the FASTQC tool (Galaxy server)

- Head to the [Galaxy](https://usegalaxy.org) project mirror
- Upload your sequencing FASTQ data
- Find the `FASTQC` program on the tool frame, and run this program with your data.

##### Running pandaseq on compressed FASTQ data (example)

```bash
$ pandaseq -f Platz16_S16_L001_R1_001.fastq.bz2 -r Platz16_S16_L001_R2_001.fastq.bz2 -w output.fasta -g log.txt
```

---

## Session 3


##### Align sequence data to rRNA databases

- Open your FASTA output file e.g. `output.fasta`, on the `Editor` (`Notepad`)
- Copy your first 10 sequences, for example this one:

```
>520_1 M02093:94:000000000-ACE80:1:1101:10143:1267:43
GTGCCAGCAGCCGCGGTAATACGGAGGGTGCAAGCGTTACTCGGAATCACTGGGCGTAAAGGGCGCGTAGGCGGATTATCAAGTCTCTTGTGAAATCTAGGAGCTTAACTTCTAAACTGCTTGGGAAACTGATAATCTAGAGTGGGGGAGAGGCAGATGGAATTGGTGGTGTAGGGGTAAAATCCGTAGATATCACCAAGAATACCCATTGCGAACGCGATCTGCTGGAACTTAACTGACGCTAATGCGCGAAAGCGTGGGGAGCAAAAAGGATTACACACCAGTGGAGTCACTTGCGACAGGGGGTCTGCGCTCGGGGAAATGTGGGGGGGGGAACTTTTATCTGTGATTCTGGGGGGAAATGGTGTCGTAGGTGGATTATCAAGGTTCTTGTGAAATCTAGGAGCTTAACTTCTAAACTGCTGTGGAACCTGATAATCTTGAGTGGGGGGTAGGCAGATGGAATTGGTGGTGTAGGGGTAAAATCCGTAGATATCACCAAGAATACCCATTGCGAAGGCGATCTGCTGGAACTTAACTGACGCTAATGCGCGAAAGCGTGGGGAGCAAACAGGATTAGAAACCCGGGTAGTCC
>520_2 M02093:94:000000000-ACE80:1:1101:15155:1492:43
GTGCTAGCAGCCGCGGTAACACGTAGGTGGCGAGCGTTATTCGGATTCACTGGGCGTAAAGGGTCCGCAGGGGGCCCTCCAAGCCCGCCGTGAAATCCCGGGGCTCAACCCCGGGCGTGCGGCGGGGACTGGCGGGCTGGATTGCGCGATGGGCAGACGGAACACCAGGTGTAGCGGTGGAAGGCGTGGATATCTGGTGGACCACCGATGGCGAAGGCGGTCTGCTGGCGCGTCACTGTCCCTCGGGGGCGCAAGCGGGGGGGGGAAGCGGGTTTTGGTACCCTGAGGGGCGACGGGGGCCCGAGGGGGCCCCCCCAGCGCGCCGTGAAATCCCGGGGGTCAACCCCGGGCGTGCGGCGGGGACTGGCGGGCTGGAGTGCGCGATGGGCAGACGGAACACCAGGTGTAGCGGTGGAATGCGTGGATATCTGGTGGAACACCGATGGCGAAGGCGGTCTGCTGGCGCGTCACTGACCCTCAGGGACGAAAGCGTGGGTAGCAAACAGGATTAGATACCCTAGTAGTCC
>520_3 M02093:94:000000000-ACE80:1:1101:11657:1599:43
GTGCCAGCGGCCGCGGTAATACGGAGGGTGCAAGCGTTAATCGGAATAACTGGGCGTAAAGGGCATGCAGGCGGTTCATCAAGTAGGATGTGAAATCCCCGGGCTCAACCTGGGAACAGCATACTAAACTGGTAGACTAGAGTATTGCAGGGGGAGACGGAATTCCAGGTGTAGCGGTGGAATGCGTAGATATCTGGAAGAACACCAAAGGCGATGGCAGTCTCCTGGGCAAATACTGACGCTCATATGCGAAAGCGTGGGTAGAAAACAGGGTTAGAAAACCTAGTAGTCCAGGGTACCGGCGTGCTCGGTAATAGGGAGGGTGTGAGGGTTAATCGGAAAAATTGGGCGGAACGGGCACGCAGGCGGTTCAGCAGGTAGGAAGTGAAATCCCCGGGGTCAACTCGGGAACAGCATACTAAACTGGTAGACTAGAGTATTGTAGGGGGGGCCGGAATTCCAGGTGTAGCGGTGAAATGCGTAGATATCTGGAAGAACACCAAAGGCGAAGGCAGTCTCCGGGGCAAATACTGACGCTCATATGCGAAAGCGTGGGTAGCAAACAGGATTAGAAACCCTAGTAGTCC
>520_4 M02093:94:000000000-ACE80:1:1101:8797:1697:43
GTGCCAGCAGCCGCGGTAATACGTATGGTGCAAGCGTTATCCGGATTTACTGGGTGTAAAGGGAGCGCAGGCGGTGCGGCAAGTCTGATGTGAAAGCCCGGGGCTCAACCGTGGGACTGCATTGGAAACTGTCGTACTAGAGTGTCGGAGAGGTAAGTGGAATTCCTAGTGTAGCGGTGAAATGCGTAGATATTAGGAGGAACACCAGTGGCGAAAGCGGCTTACTGGACGATAACTGACGCTGAGGCTCGAAAGCGTGGGGAGCAAACAGGATTAGAAAACCCGGTAACACCCTGGTTCAGTGGGCCGGGTGAATCTTGTGGGGTAAAGGTTTTTCCGGATTTCCTGGGTGGAAAGGGAGCGGAGGGGGTGCGGCAAGGTTGATGGTAAATCCCGGGGCTAAACCGTGGGACTGCATTGGAAACTGTCGTACTAGAGTGTCGGAGAGGTAAGTGGAATTCCTAGTGTAGCGGTGAAATGCGTAGATATTAGGAGGAACACCAGTGGCGAAGGCGGCTTACTGGACGATAACTGACGCTGAGGCTCGAAAGCGTGGGGAGCAAACAGGATTAGAAACCCCTGTAGTCC
>520_5 M02093:94:000000000-ACE80:1:1101:21687:1944:43
CACTCACGGCGCCCGGCGGCGGCGTTATTTCTTATGTTTCGTGGTGTGTCCTGATTTGGTGGGCTTAACGGTACTGTAGGCGGTACAACAAGCTTGCTTTGAAATGCCGGGTTTTAACCTCGGAACTGCTTTGAGAACTTTATTACTAGGGTAGCGGAGGGGCAACCGCAATTCCAGGTGTAGGGGTGAAATCTTTAGTTTTCTGTAAAAACACCGAGGGCGAAGGCAGATTTCCAGTAGATTACTCGCCGGCAGCGTCAAAGGTGCATAAGAGAAAGGTGATAGCAGCCCGGGTAGTCC
>520_6 M02093:94:000000000-ACE80:1:1101:12536:1967:43
GTGCCAGCAGCCGCAGTAATACGGAGGATGCAAGCGTTATCCGGATTTATTGGGTTTAAAGGGTGCGTAGGCTGTTCTGCAAGTCAGCGGTGAAAGCCCGGGGCTCAACCCCGGAAATGCCGTTGATACTGCGGGGCTGGAATACGGATGCCGTGGGAGGAATGAGTAGTGTAGCGGTGAAATGCATAGATATTACTCAGAACACCGATTGCGAAGGCATCTCACGAATCCGTTATTGACGCTGAGGCACGAAAGCGTGGGGATCAAACGGGCTTGGAAGCGCCTGTAGTCCGGGTCTGGCAGGTGTTATCCGGTTTTCTGGGGTTTATAGGGTGCTCAGGCTGTTCTGCAAGTGAGCGGGGCAAGCCGGGGGCTCAACCCCGGAAATGCCGTTGATACTGCGGGGCTGGAATACGGATGACGTGGGAGGAATGAGTAGTGTAGCGGTGAAATGCATAGATATTACTCAGAACACCGATTGCGAAGGCATCTCACGAATCCGTTATTGACGCTGAGGCACGAAAGCGTGGGGATCAAACAGGATTAGAAACCCCTGTAGTCC
>520_7 M02093:94:000000000-ACE80:1:1101:23738:2195:43
GTGCCAGCAGCCGCGGTAATACGTAGGTGGCAAGCGTTGTCCGGATTTACTGGGTGTAAAGGGCGTGTAGCCGGGAGGGCAAGTCAGATGTGAAATCCACGGGCTCAACTCGTGAACTGCATTTGAAACTACTCTTCTTGAGTATCGGAGAGGCAATCGGAATTCCTAGTGTAGCGGTGAAATGCGTAGATATTAGGAGGAACACCAGTGGCGAAGGCGGATTGCTGGAGAACGACTAACGGTGAGGCGCTAAAGCGTGGGGGGCAAACGTTGTTAGAATTTACGGGGTGTAAAGAGCATGTGGCCGGGAGGGCTAGTCAGATGTGAAATCCACGGGCTCAACTCGTGAACTGCATTTGAAACTACTCTTCTTGAGTATCGGAGAGGCAATCGGAATTCCTAGTGTAGCGGTGAAATGCGTAGATATTAGGAGGAACACCAGTGGCGAAGGCGGATTGCTGGACGACAACTGACGGTGAGGCGCGAAAGCGTGGGGAGCAAACAGGATTAGATACCCGTGTAGTCC
>520_8 M02093:94:000000000-ACE80:1:1101:8737:2341:43
GTGCCAGCAGCCGCGGTAATACGGAGGGTGCAAGCGTTAATCGGAATAACTGGGCGTAAAGCGCACGTAGGTGGTTCGACAAGTCAGATGTGAAAGCCCCGGGCTTAACCTGGGATGTGCATTTGAAACTGTTGGACTCGAGTACTGTAGAGGGAGGTAGAATTCCAGGTGTAGCGGTGAAATGCGTAGATATCTGGAGGAATACCAGTGGCGAAGGCGGCCTCCTGGACAGACACTGACACTGAGGTGCGAGAGCGTGGGGAGCAAACAGGATTAGAACACCTGGTATTCCCAGTCTACAGGTGCCAGCGGCGGGGGTAAGGGGGGGGGGTCAGCGGTAAATCGGCATAACGGGGCGTAAAGCGAACGTAGGGGGTTCGCAAAGTCAGATGTGAAAGCCCCGGGCTTAACCTGGGATGTGCATTTGAAACTGTTGGACTCGAGTACTGTAGAGGGAGGTAGAATTCCAGGTGTAGCGGTGAAATGCGTAGATATCTGGAGGAATACCAGTGGCGAAGGCGGCCTCCTGGACAGACACTGACACTGAGGTGCGAAAGCGTGGGGAGCAAACAGGATTAGAAACCCTGGTAGTCC
>520_9 M02093:94:000000000-ACE80:1:1101:23717:2573:43
GTGCCAGCAGCCGCGGTAAAACGTAGGTCACAAGCGTTGTCCGGAATTACTGGGTGTAAAGGGAGCGCAGGCGGGAAGACAAGTTGGAAGTGAAATCCATGGGCTCAACCCATGAACTGCTTTCAAAACTGTTTTTCTTGAGTAGTGCAGAGGTAGGCGGAATTCCCGGTGTAGCGGTGGAATGCGTAGATATCGGGAGGAACACCAGTGGCGAAGGCGGCCTACTGGGCACCAACTGACCCTGAGGCTCGCGAGTTGGGGTAGCAACGAGGGTTCAAAACGGGGGTAATAGCGGGTGTTCGGAATTACGGGGCGGAACAGGATCGCAGGCGGGAAGACAAGTTGGAAGTGAAATCCATGGGCTCAACCCATGAACTGCTTTCAAAACTGTTTTTCTTGAGTAGTGCAGAGGTAGGCGGAATTCCCGGTGTAGCGGTGGAATGCGTAGATATCGGGAGGAACACCAGTGGCGAAGGCGGCCTACTGGGCACCAACTGACGCTGAGGCTCGAAAGTGTGGGTAGCAAACAGGATTAGAAACCCGGGTAGTCC
>520_10 M02093:94:000000000-ACE80:1:1101:14065:2768:43
GTGCCAGCAGCCGCGGTAATACGGAGGGTGCAAGCGTTAATCGGAATAACTGGGCGTAAAGGGCATGCAGGCGGTTCATCAAGTAGGATGTGAAATCCCCGGGCTCAACCTGGGAACAGCATACTAAACTGGTGGACTAGAGTATTGCAGGGGGAGACGGAATTCCAGGTGTAGCGGTGGAATGCGTAGATATCTGGAAGAATACCAAAGGCGAAGGCAGTCTCCTGGGCAAATACTGACGCTCATATGCAAAAGCGTGGGTAGCAAACAGGAGTAGAAAACCGGGGTAACGCTTTAACCGGAAAGATGGGGGGGAAAGGGCATGCAGGCGGTTCATCAAGTAGGATGTGAAATCCCCGGGCTCAACCTGGGAACAGCATACTAAACTGGTGGACTAGAGTAGTGCAGGGGGAGACGGAATTCCAGGTGTAGCGGTGGAATGCGTAGATATCTGGAAGAATACCAAAGGCGAAGGCAGTCTCCTGGGCAAATACTGACGCTCATATGCGAAAGCGTGGGTAGCAAACAGGATTAGAAACCCGGGTAGTCC
```

- Create these sequences as a new text file on the `Editor`, and paste the copied sequence. Save the file with a new name, e.g. `rdpinput.fasta`
- Access the [RDP Classifier webserver](http://rdp.cme.msu.edu/classifier/classifier.jsp)
- On the RDP Classifier window, find and upload your `rdpinput.fasta` file. Click on `Submit`
- When the run is already complete, download the results by clicking on `download entire hierarchy as text file`. Open this file on the `Editor` and examine the results.

##### Install R packages

Open RStudio, and on the code window paste the following code:

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

##### Loading microbiome data 

```r
# load ggplot2 library (improved graphics)
library(ggplot2, quietly = TRUE)
# loading phyloseq library (microbiome analysis)
library(phyloseq, quietly = TRUE)

# set working directory
setwd("C:/bioinfo")

# OTU file
InputBiomFile <- "mikrobiome2019.biom"

# Samples' file
InputMapFile <- "mapping2019.tsv"

# prepare phyloseq object by loading both files
BiomData <- import_biom(InputBiomFile, parseFunction = parse_taxonomy_greengenes)
SampleData <- import_qiime_sample_data(InputMapFile)

# create phyloseq object by merging OTUs and sample data
ExperimentPhyloseqObject <- merge_phyloseq(BiomData, SampleData)
```

##### Microbial abundances per sample

```r
# Plot abundances
plot_bar(ExperimentPhyloseqTempObject, "X.SampleID", fill="Phylum")
```

##### Sample distribution

```r
ExperimentPhyloseqTempObject <- ExperimentPhyloseqObject

# Calculate distance and ordination
iDist <- distance(ExperimentPhyloseqTempObject, method="bray")
iMDS  <- ordinate(ExperimentPhyloseqTempObject, distance=iDist)

# plot sample ordination
plot_ordination(ExperimentPhyloseqTempObject, iMDS, color="Gender")

# plot sample ordination, including labels
plot_ordination(ExperimentPhyloseqTempObject, iMDS, color="Gender") + 
  geom_text(aes(label=X.SampleID), hjust=0, vjust=0) 
```

---

## Bibliography

* Afgan E et al. (2018). The Galaxy platform for accessible, reproducible and collaborative biomedical analyses: 2018 update. Nucleic Acids Research, 46(W1), W537-W544. https://doi.org/10.1093/nar/gky379
* Callahan BJ et al. (2016). Bioconductor workflow for microbiome data analysis: from raw reads to community analyses. F1000Research, 5, 1492. https://doi.org/10.12688/f1000research.8986.1
* Cole JR et al. (2014). Ribosomal Database Project: data and tools for high throughput rRNA analysis. Nucleic Acids Research, 42(D1), D633–D642. https://doi.org/10.1093/nar/gkt1244
* Comeau AM et al. (2017). Microbiome Helper: a Custom and Streamlined Workflow for Microbiome Research. mSystems 2(1): e00127-16; DOI:10.1128/mSystems.00127-16
* Gentleman RC et al. (2004). Bioconductor: open software development for computational biology and bioinformatics. Genome Biology, 5(10), R80. https://doi.org/10.1186/gb-2004-5-10-r80
* Goodrich JKK et al. (2014). Conducting a Microbiome Study. Cell, 158(2), 250–262. https://doi.org/10.1016/j.cell.2014.06.037
* Knight R et al. (2018). Best practices for analysing microbiomes. Nature Reviews Microbiology, 16, 410–422. https://doi.org/10.1038/s41579-018-0029-9
* Kozich JJ, Westcott SL, Baxter NT, Highlander SK, Schloss PD. (2013) Development of a dual-index sequencing strategy and curation pipeline for analyzing amplicon sequence data on the MiSeq Illumina sequencing platform. Applied and Environmental Microbiology. 79(17):5112-20. http://doi.org/10.1128/AEM.01043-13
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
Last update 2019/10/17


