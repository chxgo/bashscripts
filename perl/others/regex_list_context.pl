#!/usr/bin/perl
# Written by Santiago Lunar
# Using Sublime

use strict;						# Straighten rules for coding
use warnings;					# Enable warnings (same as -w)
use autodie;					# Autodie for scripts

my $text = "Fred dropped a 5 ton granite block on Mr. Slate";
my @words = ($text =~ /([a-z]+)/ig);
print "Result: @words\n"; # Result: Fred dropped a ton granite block on Mr Slate
