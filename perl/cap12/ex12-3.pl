#!/usr/bin/perl -w
# Exercise 12-3
# Written by Santiago Lunar

use strict;
use v5.10;

die "No file name specified.\n" unless @ARGV;
my $filenum = 1;

foreach my $file (@ARGV) {
	printf "File $filenum: $file -> is readable and writable.\n" if -o -r -w $file;
	$filenum++
}