#!/usr/bin/perl
# @Author: chxgo
# @Date:   2017-09-22T14:55:12-03:00
# @Last modified by:   chxgo
# @Last modified time: 2017-09-22T16:36:16-03:00

use v5.10;
use warnings;


my @fred = above_average(1..10);
print "\@fred is @fred\n";                      # (Should be 6 7 8 9 10)";
my @barney = above_average(100, 1..10);
print "\@barney is @barney\n";                  # (Should be just 100)

sub average {
  my $sum;
  foreach (@_) {
    $sum += $_;
  }
  $sum/@_;
}

sub above_average {
  my $average = average(@_);
  my @list;
  foreach my $element (@_) {
    if ($element > $average) {
      push @list, $element;
    }
  }
  @list;
}
