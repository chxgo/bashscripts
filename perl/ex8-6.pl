#!/usr/bin/perl
# Exercise 8-6

use strict;
use warnings;
use autodie;

printf "Only the lines with a space at the end will be repeated: \n";
while (<STDIN>) {
  chomp;
  if (/\p{Space}\z/) {
    print "$_*";
  } else {
    print "Does not have a space at the EOL\n";
  }
}