# DeNovo-Mutation-Pipeline
De Novo Mutation variant calling and filtering analysis pipeline using WES data

# DeNovo-Mutation-Pipeline
## De Novo Mutation variant calling and filtering analysis pipeline using WES data
### Introduction
#### DeNovo-Mutation-Pipeline is denovo variant analysis and filtering pipeline for the WES sequencing data, which call the SNP/INDEL variants based on trios (Father, Mother and Child) in the family. This tool filters SNP/INDEL variants by referring Annovar tool text file based on three main criteria : 1) Damaging variants based on in silico predictions algorithms (SIFT or PolyPhene) for SNP and Frameshift/Nonfremeshift/Stopgain/Stoploss variants for INDEL. 1) Rare variants (<=1%) in the non-Finnish population (NFE) as per GnomAD database, and 3) Variants absent in controls.

DeNovo-Mutation-Pipeline is developed as part of SeSAME syndrome familiy study. Please read the README file before using this tool.

### Requirements
DeNovo-Mutation-Pipeline is tested on the following platform:
1. OS Ubuntu v16.04.5 LTS
2. Perl 5, version 22, subversion 1 (v5.22.1)
3. VarScan variant caller
4. ANNOVAR tab-delimted annotated output file (Wang K, Li M, Hakonarson H. ANNOVAR: Functional annotation of genetic variants from next-generation sequencing data, Nucleic Acids Research, 38:e164, 2010).

### Usage
1) DeNovo-Mutation-Pipeline:
```
USAGE: DeNovo-Mutation-Pipeline.sh familyname childname fatherBam motherBam childBam workDir

arguments:
  familyname       Family name of trio
  childname        Sample name of child
  fatherBam        WES BAM file location of father sample 
  motherBam        WES BAM file location of mother sample
  childBam         WES BAM file location of child sample
  workDir          Working directory loction of trio
  
Example comand to run the analysis: 
/usr/rupali/softwares/DeNovo-Mutation-Pipeline/DeNovo-Mutation-Pipeline.sh family_1 sample_1 /samples/father.bam /samples/mother.bam /samples/child.bam /usr/rupali/family_1/

NOTE: Input files and commonds instructions- Please note that input BAM files are mandatory before running the tool and arugments needs to be seprated by the space.

Output file: 
# Variant calling result files:
trio.family_1.sample_1.mpileup
trio.family_1.sample_1.mpileup.out.indel.vcf
trio.family_1.sample_1.mpileup.out.snp.vcf

# filtering result files:
trio.family_1.sample_1.mpileup.output.indel.vcf.denovo_result.txt
trio.family_1.sample_1.mpileup.output.snp.vcf.denovo_result.txt
trio.family_1.sample_1.mpileup.output.indel.vcf.denovo_result.txt.ann
trio.family_1.sample_1.mpileup.output.snp.vcf.denovo_result.txt.ann

```
## Citation
Manuscript is in preparation.

## Contact
For technical queries, please write email to Mrs. Rupali Ravi More at rupalirmore77@gmail.com

## Contributors
Developed by: Mrs. Rupali Ravi More

Conceptualized by: Mrs. Rupali Ravi More and Dr. Ramkrishnan Kanan, Associate Research Scientist, Yale University (Supervisor)

