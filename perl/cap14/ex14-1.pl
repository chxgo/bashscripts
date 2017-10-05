#!/usr/bin/perl -w
# Exercise 14-1
# Written by Santiago Lunar

use strict;

my @numbers = <>;
my @orderNums = sort {$a <=> $b} @numbers;

foreach (@orderNums) {
	printf "%*s\n", 10, $_;
}