#!/usr/bin/perl
# Exercise 2-5
# Write a program that prompts for and reads a string and a number (on separate
# lines of input) and prints out the string the number of times indicated by the
# number on separate lines. (Hint: use the x operator.) If the user enters “fred” and
# “3”, the output should be three lines, each saying “fred”. If the user enters “fred”
# and “299792,” there may be a lot of output.

use strict;
use warnings;
print "Please enter your name: \n";
chomp (my $name = <STDIN>);
print "Now, enter your age: \n";
chomp (my $age = <STDIN>);
while ($age gt 0) {
    print "$age Your name is $name \n";
    $age -= 1;
}
