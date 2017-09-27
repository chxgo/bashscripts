#!/usr/bin/perl
# Exercise 8-6

use strict;
use warnings;
use autodie;

printf "Please write some ramdom text: \n";
while (<STDIN>) {
  chomp;
  if (/\p{Space}\z/) {
    print "$_*";
  } else {
    print "Not found\n";
  }
}
