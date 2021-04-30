#!/usr/bin/perl
# USAGE: perl 4_snp_anno.pl familyName sampleName workDir

my $famname = $ARGV[0];

my $samname = $ARGV[1];

my $workdir = $ARGV[2];

open (FR, "$workdir/$famname/trio.$famname.$samname.mpileup.out.indel.vcf")or die "cannot open file";
open(my $outfile1, ">","$workdir/$famname/trio.$famname.$samname.mpileup.out.indel.vcf.filter.txt");

  while (my $line = <FR>)
{
chomp($line);

my (@words)= split /\t/, $line;
       my ($s1,$s2) = split /;/, "$words[7]";
       if ($line =~ m/^#/){next;}

               #print "$s2\n" ;
         my ($c1,$c2,$c3,$c4,$c5,$c6,$c7,$c8) = split /:/, "$words[11]";
          my ($m1,$m2,$m3,$m4,$m5,$m6,$m7,$m8) = split /:/, "$words[10]";
          my ($f1,$f2,$f3,$f4,$f5,$f6,$f7,$f8) = split /:/, "$words[9]";

           my ($c_freq,$r)= split /%/, "$c7";
           my ($m_freq,$r)= split /%/, "$m7";
            my ($f_freq,$r)= split /%/, "$f7";
              #print "$f_freq\n" ;
           #if (("$s2" eq "STATUS=3") && ("$c1" eq "0/1") || ("$c1" eq "1/0"))
           #if (("$s2" eq "STATUS=3") && ("$c_freq" >= 40) && ("$c1" eq "0/1") || ("$c1" eq "1/0") && ("$c3" >= 20))
           # if ("$s2" eq "STATUS=3")
            #if (("$s2" eq "STATUS=3") && ("$c1" eq "0/1") || ("$c1" eq "1/0"))
             if (("$s2" eq "STATUS=3") && ("$c1" eq "0/1") || ("$c1" eq "1/0"))

           #if (("$s2" eq "STATUS=3") && ("$c1" eq '0/1') || ("$c1" eq '1/0') && ("$c3" >= 20))
            {
                  if ( ("$c3" >= 20) && "$c5" >= 8)
                   #if (("$c5" >= 8)&& ("$c_freq" >=40))
                   #if (("$c5" >= 8) && ("$f_freq" < 5)&& ("$m_freq" < 5) && ("$c_freq" >=40))
               {
                  if (("$f_freq" < 5) && ("$m_freq" < 5) && ("$c_freq" >=40))

                  {
                       #print "$line\n";
                       print $outfile1 "$line\n";
            
                  }
             }   
                  
            }
            
   }