#!/usr/bin/perl -w
# Exercise 13-5
# Written by Santiago Lunar

use strict;

chomp(my ($name, $newname) = @ARGV);
if ($name=~/\A\s*\z/ or $newname=~/\A\s*\z/) {
	print "No filename or newname specified\n";
} elsif (rename $name, $newname) {
	print "Succesfully change of names\n" or die "Something went wrong\n";
}