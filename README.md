# UMR Microbiome Praktikum WS2020/21

Scripts and tutorials for analyzing microbiome data. Lab practice for the lecture: [Moderne molekulare und Hochdurchsatz-Technologien in der medizinischen Grundlagenforschung](https://lsf.uni-rostock.de/qisserver/rds;jsessionid=BB8A59F014D3F7C41005016CB244C476.node2?state=verpublish&status=init&vmfile=no&moduleCall=webInfo&publishConfFile=webInfo&publishSubDir=veranstaltung&navigationPosition=lectures%2Csearch&breadcrumb=searchLectures&topitem=lectures&subitem=search&veranstaltung.veranstid=115284)

---

## Description

These sessions will cover the use of a variety of software tools needed for the analysis of microbiome data, from the handling of the Illumina sequencing data, to the processing of 16S rRNA amplicon data. During these sessions, the students will be able to:

* Evaluate the quality of an Illumina sequencing run, including data filtering;
* Carry out assemblies of 16S rRNA amplicons;
* Learn the basics on the R programming language and environment; and 
* State how to manipulate microbiome data including count tables and sample metadata. 

##### Venues and Dates

- Session 1, Software install: [Schillingallee 69a, 70 - SR1, Med. Th. Instit., Schillingallee 70](https://lsf.uni-rostock.de/qisserver/rds?state=verpublish&status=init&vmfile=no&moduleCall=webInfo&publishConfFile=webInfoRaum&publishSubDir=raum&keep=y&raum.rgid=2114) <br>
30.9.2020, 13 hrs. 	
- Sessions 2-3, Data analysis: [IBIMA](https://ibima.med.uni-rostock.de) Computerraum ([Ernst-Heydemann-Str. 8](https://goo.gl/maps/JGDWhPDLHxG2), 3. Etage, Nr. 3016) <br>
14.10 and 21.10.2020, 10:00 - 11:30 hrs.

---

## Materials and online methods


##### Data

- Illumina data: [cloud drive](https://drive.google.com/drive/folders/16M2Gn7gn_3vORVX6uAy4k9LdNNsL7KO_); see `fastq` folder
- Alternatively, the course can be also followed using the [MiSeq SOP](http://www.mothur.org/w/images/d/d6/MiSeqSOPData.zip) FASTQ files (Kosich et al., 2013).

##### Online tools

* [Galaxy](https://usegalaxy.eu) european project mirror (US version [here](https://usegalaxy.org))
* [RDP Classifier webserver](http://rdp.cme.msu.edu/classifier/classifier.jsp)


---

## Session 1: Setup

Create a directory under the root path called `bioinfo` and place all the downloaded files there

Linux/Mac:

```bash
# linux / mac osx command line
$ cd /
$ mkdir bioinfo
```

Windows:

```
C:\Users\barrantes> cd ..\..
C:\> mkdir bioinfo
```


##### Software

- `FastQC`: [Windows/Linux zip file](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip); Mac [DMG image](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.dmg)

- `R`: [Windows](https://ftp.gwdg.de/pub/misc/cran/bin/windows/base/R-4.0.2-win.exe), [OSX](https://cran.rstudio.com/bin/macosx/R-3.6.1.pkg) 10.11+; Linux versions [here](https://cran.r-project.org/bin/linux/)

- `RStudio`: [Windows 10/8/7](https://download1.rstudio.org/desktop/windows/RStudio-1.2.5001.exe) (64 bit), [OSX](https://download1.rstudio.org/desktop/macos/RStudio-1.2.5001.dmg) 10.12+, [Ubuntu](https://download1.rstudio.org/desktop/trusty/amd64/rstudio-1.2.5001-amd64.deb) 14. 

_Note_: There are **no** 32-bit versions of RStudio. In this case, students can use one of the few PCs in the Computer Room that have already RStudio installed.

- `pandaseq`: [Windows](https://github.com/neufeld/pandaseq/releases/download/v2.11/pandaseq-2.11.zip), [OSX](https://github.com/neufeld/pandaseq/releases/download/v2.11/PANDAseq-2.11.pkg). Install instructions [here](https://github.com/neufeld/pandaseq/wiki/Installation). 

For most Debian and Ubuntu based distributions, the installation is as follows:

```bash
# linux command line
$ sudo apt-add-repository ppa:neufeldlab/ppa 
$ sudo apt-get update 
$ sudo apt-get install pandaseq
```

Alternatively, it can be also installed directly from the respective RPM package manager:

```bash
# linux command line
# download the latest package manager
$ wget https://github.com/neufeld/pandaseq/releases/download/v2.11/pandaseq-2.11-1.fc20.x86_64.rpm
# install (requires sudo privileges)
$ sudo rpm –i pandaseq-2.11-1.fc20.x86_64.rpm
# alternatively, the install can also be done with yum:
$ sudo yum localinstall pandaseq-2.11-1.fc20.x86_64.rpm
```



---

## Session 2

##### Quality control with the FASTQC tool (Galaxy server)

- Head to the [Galaxy](https://usegalaxy.eu) project mirror
- Upload your sequencing FASTQ data
- Find the `FASTQC` program on the tool frame, and run this program with your data.

##### Running pandaseq on compressed FASTQ data (example)

Open the `Terminal` 

- Windows: Go to `Start`, search for "cmd" to open the `Command Prompt`
- Ubuntu Linux: `Applications` / `Accessories` 
- Mac OSX: `Applications` / `Utilities`


Linux/Mac instructions:

```bash
$ cd /bioinfo
$ pandaseq -f Platz16_S16_L001_R1_001.fastq \
 -r Platz16_S16_L001_R2_001.fastq \
 -w Platz16.output.fasta \
 -g log.txt
```

Windows instructions:

```
C:\Users\barrantes> cd ..\..
C:\> cd bioinfo

# call the help from pandaseq
C:\bioinfo> panda\pandaseq.exe -h

# run pandaseq with the FASTQ data
C:\bioinfo> panda\pandaseq.exe -f Platz16_S16_L001_R1_001.fastq -r Platz16_S16_L001_R2_001.fastq -w Platz16.output.fasta -g log.txt
```


---

## Session 3


##### 3.1 Align sequence data to rRNA databases

- Open your FASTA output file e.g. `output.fasta`, on the `Editor` (`Notepad`)

Windows users: Choose a program to open ("_Programm aus einer Liste installierter Programme auswählen_"), then pick the `Editor` (`Notepad`)

- Copy your first 10 sequences. Linux/Mac instructions:

```bash
$ head Platz16.output.fasta
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

Windows command:

```
C:\bioinfo> type Platz16.output.fasta | more
```

- Access the [RDP Classifier webserver](http://rdp.cme.msu.edu/classifier/classifier.jsp) and paste the copied sequence in the textbox under `Cut and paste sequence(s) (in Fasta, GenBank, or EMBL format):`
- Click on `Submit`. When the run is already complete, examine the results. These can be also downloaded by clicking on `download entire hierarchy as text file`.

##### 3.2 Install R packages

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


##### 3.3 Loading libraries and microbiome data 

```r
# load ggplot2 library (graphics)
library(ggplot2, quietly = TRUE)

# loading phyloseq library (microbiome analysis)
library(phyloseq, quietly = TRUE)

# set working directory (windows)
setwd("C:/bioinfo")
# set working directory (linux/mac)
setwd("/bioinfo")

# OTU data
InputBiomFile <- "mikrobiome2020.biom"

# Samples' data
InputMapFile <- "mapping2020.tsv"

# prepare phyloseq object by loading both files
BiomData <- import_biom(InputBiomFile, parseFunction = parse_taxonomy_greengenes)
SampleData <- import_qiime_sample_data(InputMapFile)

# create phyloseq object by merging OTU and sample data
ExperimentPhyloseqObject <- merge_phyloseq(BiomData, SampleData)

# create a temporary phyloseq object for working
ExperimentPhyloseqTempObject <- ExperimentPhyloseqObject
```

##### 3.4 Microbial communities

```r
# Plot abundances
plot_bar(ExperimentPhyloseqTempObject, "X.SampleID", fill="Phylum")
```

##### 3.5 Sample ordination

```r
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

* Afgan E et al. (2018). The Galaxy platform for accessible, reproducible and collaborative biomedical analyses: 2018 update. _Nucleic Acids Research_, 46(W1), W537-W544. https://doi.org/10.1093/nar/gky379
* Callahan BJ et al. (2016). Bioconductor workflow for microbiome data analysis: from raw reads to community analyses. _F1000Research_, 5, 1492. https://doi.org/10.12688/f1000research.8986.1
* Cole JR et al. (2014). Ribosomal Database Project: data and tools for high throughput rRNA analysis. _Nucleic Acids Research_, 42(D1), D633–D642. https://doi.org/10.1093/nar/gkt1244
* Comeau AM et al. (2017). Microbiome Helper: a Custom and Streamlined Workflow for Microbiome Research. _mSystems_, 2(1): e00127-16; DOI:10.1128/mSystems.00127-16
* Gentleman RC et al. (2004). Bioconductor: open software development for computational biology and bioinformatics. _Genome Biology_, 5(10), R80. https://doi.org/10.1186/gb-2004-5-10-r80
* Goodrich JKK et al. (2014). Conducting a Microbiome Study. _Cell_, 158(2), 250–262. https://doi.org/10.1016/j.cell.2014.06.037
* Knight R et al. (2018). Best practices for analysing microbiomes. _Nature Reviews Microbiology_, 16, 410–422. https://doi.org/10.1038/s41579-018-0029-9
* Kozich JJ, Westcott SL, Baxter NT, Highlander SK, Schloss PD. (2013) Development of a dual-index sequencing strategy and curation pipeline for analyzing amplicon sequence data on the MiSeq Illumina sequencing platform. _Applied and Environmental Microbiology_, 79(17):5112-20. http://doi.org/10.1128/AEM.01043-13
* Masella AP et al. (2012). PANDAseq: Paired-end assembler for illumina sequences. _BMC Bioinformatics_, 13(1), 31. https://doi.org/10.1186/1471-2105-13-31
* McDonald D et al. (2012). The Biological Observation Matrix (BIOM) format or: how I learned to stop worrying and love the ome-ome. _GigaScience_, 1(1), 7. https://doi.org/10.1186/2047-217X-1-7
* McMurdie PJ and Holmes S. (2013). Phyloseq: An R Package for Reproducible Interactive Analysis and Graphics of Microbiome Census Data. _PLoS ONE_, 8(4), e61217. https://doi.org/10.1371/journal.pone.0061217

---

## Contact

Dr. rer. nat. Israel Barrantes <br>
Junior Research Group Translational Bioinformatics <br>
Institute for Biostatistics and Informatics in Medicine and Ageing Research, Office 3017<br>
Rostock University Medical Center<br>
Ernst-Heydemann-Str. 8<br>
18057 Rostock, Germany<br>

Email: israel.barrantes[bei]uni-rostock.de

---
Last update 2020/10/01


