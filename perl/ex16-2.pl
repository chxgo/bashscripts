#!/usr/bin/perl -w 
# Exercise 16-2
# Written by Santiago Lunar

use strict;
use Cwd;

my $userDir = getcwd();
opendir MYDIR, $userDir or die "Cannot open $userDir";
foreach (readdir MYDIR) {
	my ($mod, $acc) = (stat)[8,9];
	printf "Filename: %20s was modified: %10s and accesed %10s \n", $_, $mod, $acc;
}