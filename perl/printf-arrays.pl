#!/usr/bin/perl
# Use of printf with arrays

use strict;
use warnings;

my @items = qw/ wilma dino pebbles /;
# my $format = "The items are: \n" . ("%-10s\n" x @items);
# printf $format, @items;

# Even better
printf "The items are: \n" . ("%-10s\n" x @items), @items;
