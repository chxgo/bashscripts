#!/usr/bin/perl
# Written by Santiago Lunar

use strict;
use warnings;
use autodie;

my $text = "Fred dropped a 5 ton granite block on Mr. Slate";
my @words = ($text =~ /([a-z]+)/ig);
print "Result: @words\n"; # Result: Fred dropped a ton granite block on Mr Slate
