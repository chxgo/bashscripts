#!/usr/bin/perl
# Written by Santiago Lunar
# Exercise 7-1

#use strict;
use warnings;
use autodie;

printf "Enter some words metioning \*Fred\*\n";
while (<STDIN>) {
  if (/[Ff]red/) {
    print;
  }
}
