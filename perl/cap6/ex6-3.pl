#!/usr/bin/perl
# Written by Santiago Lunar
# Exercise 6-3

use strict;
use autodie;
use warnings;

my $longestKey = 0;
foreach my $key ( keys %ENV) {
  my $key_length = length ( $key );
  $longestKey = $key_length if $key_length > $longestKey;
}

my $longestValue = 0;
foreach my $value ( values %ENV) {
  my $key_length = length ( $value );
  $longestValue = $key_length if $key_length > $longestValue;
}

while ((my $key, my $value) = each %ENV) {
  printf "%*s => %*s\n", $longestKey, $key, $longestValue, $value;
}
