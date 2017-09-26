#!/usr/bin/perl
# Written by Santiago Lunar
# Exercise 7-1

#use strict;
use warnings;
use autodie;

printf "Enter some words metioning \*fred\*\n";
while (<STDIN>) {
  if (/fred/) {
    print;
  }
}
