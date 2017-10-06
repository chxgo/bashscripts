#!/usr/bin/perl -w
# Stat function use
# Written by Santiago Lunar

use strict;

my @info = stat(@ARGV);
my $num = 1;
foreach my $attr (@info) {
	printf "Arribute %s is: %s\n", $num, $attr;
	$num++;
}