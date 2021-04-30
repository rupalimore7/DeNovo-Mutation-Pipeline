#!/bin/bash
#!
#! Name of the job:
#SBATCH -J dnv
#SBATCH --mail-type=END
#SBATCH -m cyclic:block
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -p RRP1
#SBATCH --mail-user=rupalirmore77@gmail.com

JOBID=$SLURM_JOB_ID

echo -e "JobID: $JOBID\n======" 
echo "Time: `date`" 
echo "Running on node: `hostname`" 
echo "Current directory: `pwd`" 

#######
echo "Welcome to DeNovo-Mutation-Pipeline";
#######

echo "famname: $1";
echo "childname: $2";
echo "fatherBam: $3";
echo "motherBam: $4";
echo "childBam: $5";
echo "workdir: $6";

# Set path
DeNovo-Mutation-Pipeline_dir="/softwares/DeNovo-Mutation-Pipeline"
reference="/mnt/DATA/home4/arc/hb493/b37/Ensembl_GRCh37.ordered.fa"
dbsnp="/mnt/b2/home4/arc/rm975/softwares/databases/gatk_db/dbsnp_138.hg19.vcf"
softwares="/mnt/b2/home4/arc/rm975/softwares"

#Generate a three-sample mpileup
samtools mpileup -B -q 1 -f $reference $3 $4 $5 > $6/$1/"trio."$1.$2.mpileup

#Trio variant calling
java -jar $softwares/varscan-master/VarScan.v2.4.4.jar trio $6/$1/trio.$1.$2.mpileup $6/$1/trio.$1.$2.mpileup.out --min-coverage 10 --min-var-freq 0.20 --p-value 0.05 -adj-var-freq 0.05 -adj-p-value 0.15

#snp
perl $softwares/annovar/table_annovar.pl $6/$1/trio.$1.$2.mpileup.out.snp.vcf $softwares/annovar/humandb/ -buildver hg19 -out $6/$1/trio.$1.$child.mpileup.out.snp.vcf.ann -remove -protocol refGene,cytoBand,genomicSuperDups,esp6500siv2_ea,1000g2015aug_all,1000g2015aug_afr,1000g2015aug_amr,1000g2015aug_eas,1000g2015aug_eur,1000g2015aug_sas,exac03,avsnp150,clinvar_20190305,gnomad211_genome,revel,dbnsfp33a -operation g,r,r,f,f,f,f,f,f,f,f,f,f,f,f,f -nastring . -vcfinput

#indel
perl $softwares/annovar/table_annovar.pl $6/$1/trio.$1.$2.mpileup.out.indel.vcf $softwares/annovar/humandb/ -buildver hg19 -out $6/$1/trio.$1.$child.mpileup.out.indel.vcf.ann -remove -protocol refGene,cytoBand,genomicSuperDups,esp6500siv2_ea,1000g2015aug_all,1000g2015aug_afr,1000g2015aug_amr,1000g2015aug_eas,1000g2015aug_eur,1000g2015aug_sas,exac03,avsnp150,clinvar_20190305,gnomad211_genome,revel,dbnsfp33a -operation g,r,r,f,f,f,f,f,f,f,f,f,f,f,f,f -nastring . -vcfinput

#snp filtering
perl $DeNovo-Mutation-Pipeline_dir/2_snp_filtering.pl $1 $2 $6

perl $DeNovo-Mutation-Pipeline_dir/3_indel_filtering.pl $1 $2 $6

perl $DeNovo-Mutation-Pipeline_dir/4_snp_anno.pl $1 $2 $6

perl $DeNovo-Mutation-Pipeline_dir/5_indel_anno.pl $1 $2 $6


