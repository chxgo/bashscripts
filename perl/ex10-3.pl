#!/usr/bin/perl
# Written by Santiago Lunar
# Exercise 6-3

use v5.10;
use warnings;

my $longestKey = 0;
foreach my $key (keys %ENV) {
  my $key_length = length ( $key );
  $longestKey = $key_length if $key_length > $longestKey;
}

foreach my $key (sort keys %ENV) {
  printf "%*s\n", $longestKey, $key if $ENV{$key} // "(undefined)";
}
