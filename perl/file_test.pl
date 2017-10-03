#!/usr/bin/perl -w
# Use of File Test Operators
# Written by Santiago Lunar

use strict;
use v5.10;

foreach my $filename (@ARGV) {
	print "$filename is readable and writable!\n" if (-r -w $filename);
} 