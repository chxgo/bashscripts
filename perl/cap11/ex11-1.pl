#!/usr/bin/perl -w
# Written by Santiago Lunar
# Exercise 11-1

use strict;
use Module::CoreList;

my %modules = %{$Module::CoreList::version{5.024}}; # prints 1.48

while (my $key = each %modules) {
  printf "%s\n", $key;
}