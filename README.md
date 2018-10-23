# Microbiome Analysis

## Description

These sessions will cover the use of a variety of software tools needed for the analysis of microbiome data, from the handling of the Illumina sequencing data, to the processing of 16S rRNA amplicon data. During these sessions, the students will be able to:

* Evaluate the quality of an Illumina sequencing run, including data filtering;
* Carry out assemblies of 16S rRNA amplicons;
* Learn the basics on the R programming language and environment; and 
* State how to manipulate microbiome data including count tables and sample metadata. 

#### Prerequisites

Participants must have already taken [Medical Bioinformatics](https://sites.google.com/site/medbioinf2018/home), or an equivalent basic course in Bioinformatics. No previous knowledge of programming and/or working with the command line interface are required.

#### Venue and Dates

[IBIMA](https://ibima.med.uni-rostock.de) Computerraum ([Ernst-Heydemann-Str. 8](https://goo.gl/maps/JGDWhPDLHxG2), 3. Etage, Nr. 3016) <br>
17.10 and 24.10.2018, 10:00 - 11:30 hrs.

## Materials and Data

#### Software

To carry on with the analyses, the students the following programs already installed before the Praktikum sessions:

* `RStudio`: https://www.rstudio.com/products/rstudio/download/
* `PANDAseq`: https://github.com/neufeld/pandaseq/wiki/Installation

Please notice that `PANDAseq` requires certain libraries in Linux and Mac OSX to be installed beforehand, as indicated on the link above.

#### Online tools

* European [Galaxy mirror](https://usegalaxy.eu)
* [RDP Aligner](https://pyro.cme.msu.edu/aligner/form.spr)
* [RDP Complete Clustering](https://pyro.cme.msu.edu/cluster/form.spr) tool

#### Experimental Data

* Slides and data for the course: [link](http://tiny.cc/UMRMicrobiome2018) (**Note**: This link will expire shortly after the Praktikum sessions).

Alternatively, the course can be also followed using the [MiSeq SOP](http://www.mothur.org/w/images/d/d6/MiSeqSOPData.zip) FASTQ files.

#### Sequencing and Assembly results

<details>
  <p>
    
|sequencing_id|reads_forward|bases_forward|reads_reverse|bases_reverse|assembly_sequences|
|---|---:|---:|---:|---:|---:|
|Platz1|932,488|233,195,615|932,488|232,946,687|806,369|
|Platz2|1,176,871|294,977,140|1,176,871|294,594,514|988,052|
|Platz3|818,952|205,177,629|818,952|204,824,283|572,816|
|Platz4|1,221,237|306,468,668|1,221,237|306,100,454|1,029,695|
|Platz5|1,260,712|314,513,399|1,260,712|314,196,043|1,060,933|
|Platz6|1,251,320|313,669,483|1,251,320|313,121,910|952,852|
|Platz7|695,157|174,290,050|695,157|174,067,296|601,401|
|Platz8|15,600|3,903,832|15,600|3,902,038|6,921|
|Platz9|1,550,588|386,120,188|1,550,588|385,955,426|1,171,064|
|Platz10|900,732|223,652,346|900,732|223,454,321|747,295|
|Platz11|1,662,734|416,499,601|1,662,734|416,096,220|1,494,020|
|Platz12|1,388,384|348,066,580|1,388,384|347,631,020|1,204,623|
|Platz13|1,363,256|342,121,465|1,363,256|341,495,868|1,072,794|
|Platz14|664,251|166,505,389|664,251|166,316,506|590,636|
|Platz15|1,569,053|389,432,834|1,569,053|389,072,672|1,339,929|
|Platz16|921,925|231,215,421|921,925|230,889,142|731,722|
|Platz17|206,713|51,642,956|206,713|51,585,247|178,823|
|Platz18|278,912|69,600,821|278,912|69,535,014|239,711|
|Platz19|1,210,718|303,664,991|1,210,718|303,121,103|924,736|
|Kontrolle1|130,990|32,495,525|130,990|32,467,934|96,468|
|Kontrolle2|131,487|32,942,960|131,487|32,915,422|104,666|
|negativ|33,802|2,056,765|33,802|2,188,684|3,656|

  <p>
</details>
  

  
## References

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



## Contact

Dr. rer. nat. Israel Barrantes <br>
Institute for Biostatistics and Informatics in Medicine and Ageing Research, Office 3017<br>
Rostock University Medical Center<br>
Ernst-Heydemann-Str. 8<br>
18057 Rostock, Germany<br>

Email: israel.barrantes[at]uni-rostock.de


---

Last update: 2018/10/17
