#!/usr/bin/perl
# Writter by Santiago Lunar
# Exercise 6-2

use strict;
use autodie;
use warnings;

my %count;
chomp(my @words = <STDIN>);

foreach my $word (@words) {
  $count{$word} += 1;
}

foreach my $word (keys %count) {
  printf "The word %s has been seen %s times.\n", $word, (sort $count{$word});
}
