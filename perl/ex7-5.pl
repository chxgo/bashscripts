#!/usr/bin/perl
# Exercise 7-4

use strict;
use warnings;

printf "Please write any text that contains \*wilma\* or \*fred\*: \n";
while (<STDIN>) {
  if (/(wilma|fred)/) {
    print;
  }
}
