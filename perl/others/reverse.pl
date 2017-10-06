#!/usr/bin/perl
# Example use of Revers inside a subrutine

use v5.10;
use strict;
use warnings;

sub list_from_fred_to_barney {
  state $fred = 11;
  state $barney = 6;
  if ($fred < $barney) {
    # Count upwards from $fred to $barney
    $fred..$barney;
  } else {
    # Count downwards from $barney to $fred
    reverse $barney..$fred;
  }
}

my @c = &list_from_fred_to_barney;
print "@c\n";
