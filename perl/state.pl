#!/usr/bin/perl
# Example use of state instead of my

use v5.10;
use warnings;
running_sum( 5, 6 );
running_sum( 1..3 );
running_sum( 4 );

sub running_sum {
  state $sum = 0;
  state @numbers;
  foreach my $number ( @_ ) {
    push @numbers, $number;
    $sum += $number;
  }
say "The sum of (@numbers) is $sum"; }
