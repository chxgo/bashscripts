#!/usr/bin/perl -w
# Use of File Test Operators
# Written by Santiago Lunar

use strict;
use v5.10;

foreach my $filename (@ARGV) {
	if (! -r $filename) {
		print "$filename is readable\n";
	} elsif (! -w _) {
		print "$filename is not writable\n";
	} elsif (-x _) {
		print "$filename is executable\n";
	} elsif (-e _) {
		print "$filename exists\n";
	} else {
		print "The end\n";
	}
} 