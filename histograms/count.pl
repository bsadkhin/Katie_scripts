#!/usr/bin/env perl

while(<>){
    my @line = split ",";
    if($line[1] > 100000){
        print $_;
    }

}
