#!/usr/bin/perl
# Exercise 4-4
# @Author: chxgo
# @Date:   2017-09-22T16:44:53-03:00
# @Last modified by:   chxgo
# @Last modified time: 2017-09-22T16:54:31-03:00

use v5.10;

greet ('Fred');
greet ('Barney');

sub greet {
  state $last_person;

  my $name = shift;

  print "Hi! $name ";
  if (defined $last_person) {
    print "$last_person is here!\n";
  } else {
    print "You are the first one ever!\n";
  }
  $last_person = $name;
}
