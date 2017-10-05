#!/usr/bin/perl -w
# Exercise 14-2
# Written by Santiago Lunar

use strict;

my %last_name = qw{ fred flintstone Wilma Flintstone Barney Rubble betty rubble Bamm-Bamm Rubble PEBBLES FLINTSTONE };	

my @family = sort by_last_name_and_first_name keys %last_name;

foreach (@family) {
	print "$_\n";
}

sub by_last_name_and_first_name {
	"\L$last_name{$a}" cmp "\L$last_name{$b}"
	or
	"\L$a" cmp "\L$b"
}