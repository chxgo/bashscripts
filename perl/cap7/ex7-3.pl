#!/usr/bin/perl
# Exercise 7-3

use strict;
use warnings;
use autodie;

printf "Please write any text including capitalized words but ALL CAPITALIZED: \n";
while(<STDIN>) {
  if(/[A-Z][a-z]+/) {
    print;
  }
}
