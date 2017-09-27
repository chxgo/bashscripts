#!/usr/bin/perl
# Exercise 7-4

use strict;
use warnings;

printf "Please write sentences that has two of the same nonwhitespace characters next to each other: \n";
while (<STDIN>) {
  if (/(.)\1/) {
    print;
  }
}
