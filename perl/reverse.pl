#!/usr/bin/perl
# Example use of Revers inside a subrutine

use strict;
use warnings;

sub list_from_fred_to_barney {
  my $fred = 11;
  my $barney = 6;
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
