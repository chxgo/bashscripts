#!/usr/bin/perl -w
# Exercise 13-8
# Written by Santiago Lunar

use strict;

foreach (my @files = sort <* .*>) {
	print "$_\n" if readlink; 
}