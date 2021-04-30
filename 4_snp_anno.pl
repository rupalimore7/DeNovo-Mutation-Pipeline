#!/usr/bin/perl
# USAGE: perl 4_snp_anno.pl familyName sampleName workDir

my $famname = $ARGV[0];

my $samname = $ARGV[1];

my $workdir = $ARGV[2];


open(my $outfile,">", "$workdir/$famname/trio.$famname.$samname.mpileup.out.snp.vcf.filter.txt.ann");

#my $filename = "EXM055_2.txt";
open FILE1, "$workdir/$famname/trio.$famname.$samname.mpileup.out.snp.vcf.filter.txt" or die;

my %hash={};
while (my $line=<FILE1>) {
   chomp($line);
   my ($b1,$b2,$b3) = split /\t/, $line;
   $hash{"$b1:$b2"} = "";
}

open (TXTFILE, "$workdir/$famname/trio.$famname.$samname.mpileup.out.snp.vcf.ann.hg19_multianno.txt");  #search file

#print {$outfile} "#chr\tpos\t$filename\n";
while (<TXTFILE>)
{
chomp;
   my (@var)=split (/\t/);
#    my ($c1,$c2,$c3,$c4,$c5,$c6,$c7,$c8,$c9,$c10,$c11,$c12,$c13,$c14,$c15,$c16,$c17,$c18,$c19,$c20) = split /\t/, $_;
    my $chrpos="$var[120]:$var[121]";
    #print "$chrpos\n";

   if (exists($hash{$chrpos})){
          print"$_\n";
       print{$outfile} "$_\n";

       #print {$outfile1} "\t$var[132]";
   }

}




