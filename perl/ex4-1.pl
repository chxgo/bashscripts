#!/usr/bin/perl
# Exercise 4-1
# Write a subroutine, named total, which returns the total of a list of numbers.
# Hint: the subroutine should not perform any I/O; it should simply process its parameters and
# return a value to its caller. Try it out in this sample program, which merely exercises
# the subroutine to see that it works. The first group of numbers should add up to 25.

use v5.10;
use warnings;

my @fred = qw{ 1 3 5 7 9 };
my $fred_total = total(@fred);
print "The total of \@fred is $fred_total.\n";
print "Enter some additional numbers on separate lines: ";
my $user_total = total(<STDIN>);
print "The total of those numbers is $user_total.\n";

sub total {
  my @sum;
  foreach (@_) {
    $sum += $_;
  }
  return $sum;  # Explicit use of return
}
