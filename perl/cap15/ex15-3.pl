#!/usr/bin/perl -w
# Exercise 15-3
# Written by Santiago Lunar

use strict;

my $day = substr ((system 'date'), 0, 1);
if ($day eq "S") {
	printf "Bon weekend!\n";
} else {
	printf "Shouldn't you be at wortk\?\n";
}