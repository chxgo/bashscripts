#!/usr/bin/perl
# Exercise 4-2
#

sub total {
  foreach (@_) {
    $sum += $_;
  }
  return $sum;  # Explicit use of return
}

$addUp = total(1..1000);
print "The numbers from 1 to 1000 add up to $addUp\n";
