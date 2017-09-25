#!/usr/bin/perl
# Exercise 4-4
# @Author: chxgo
# @Date:   2017-09-22T16:44:53-03:00
# @Last modified by:   chxgo
# @Last modified time: 2017-09-22T17:09:47-03:00

use v5.10;

greet ('Fred');
greet ('Barney');
greet ('Wilma');
greet ('Betty');

sub greet {
  state @last_person;

  my $name = shift;

  print "Hi! $name ";
  if (@last_person) {
    foreach ($_) {
      print "I've seen: @last_person\n";
      push @last_person, $name;
    }
  } else {
    print "You are the first one ever!\n";
    push @last_person, $name;
  }
}
