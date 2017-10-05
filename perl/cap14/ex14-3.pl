#!/usr/bin/perl -w
# Exercise 14-3
# Written by Santiago Lunar

use strict;

chomp(my $lString = "\"This is a very long test with some words\"");
print "$lString\n\n";
printf "Please type a character inside the string to count\n\n";
chomp(my $sString = <STDIN>);

my @positions;
while (1) { # tricky use of three-part for loop
	my $pos = -1;
	$pos = index($lString, $sString, $pos + 1); # find next position 
	last if $pos == -1;
	push @positions, $pos; 
}

print "@positions\n";

