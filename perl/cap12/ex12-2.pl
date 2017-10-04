#!/usr/bin/perl -w
# Exercise 12-2
# Written by Santiago Lunar

use strict;

die "No file names supplied!\n"	unless @ARGV;

my $oldest = 0;
foreach my $file (@ARGV) {
  my $old = -M $file;
  $oldest = $old if $old > $oldest;
}

printf "The oldest file is %s days.\n", int($oldest);