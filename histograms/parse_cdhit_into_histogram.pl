#!/usr/bin/env perl
use strict;

my %hash;
my @bins = reverse(0,100,1000,5000,10000,15000,20000,25000,30000,35000,40000,45000,50000,100000,150000,200000);
 
my %count;
my %cdhit;

my $lc =0;
while(<>){
    $lc++; 
    my ($pfam,$count,$r_100_100,$r_98_80) = split /,/;
        foreach my $bin(@bins){
        if($count >= $bin){
            print "assigning $pfam to $bin (count:$count) ($lc)\n";
            $count{$bin} ++;
            last;           
        }
    }
    foreach my $bin(@bins){
        if($r_100_100 > $bin){
            $cdhit{$bin} ++;
            last;
        }
    }

}

print join "\t", "Bin", "Count" , "Cdhit @ 100/100\n";
foreach my $bin (@bins){
    my $count = 0;
    my $cdhit = 0;
    $count += $count{$bin};
    $cdhit += $cdhit{$bin};
    print join "\t", $bin, $count, $cdhit , "\n"


}



close F;
