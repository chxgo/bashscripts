#!/usr/bin/perl
# Exercise 3-2
# Write a program that reads a list of numbers (on separate lines) until end-ofinput
#and then prints for each number the corresponding person’s name from the
#following list. (Hardcode this list of names into your program. That is, it should
# appear in your program’s source code.) For example, if the input numbers were 1,
#2, 4, and 2, the output names would be fred, betty, dino, and betty:
# fred betty barney dino wilma pebbles bamm-bamm

#use strict;
use warnings;

@names = qw/ fred betty barney dino wilma pebbles bamm-bamm /;
print "Write numbers from 1 to 7 pressing \"Enter\" after each one, then press Ctrl-D:\n";
chomp(@numbers = <STDIN>);
foreach (@numbers) {
  print "$names[ $_ - 1 ]\n";
}
