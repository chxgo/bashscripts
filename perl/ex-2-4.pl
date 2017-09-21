#!/usr/bin/perl
# Exercise 2-4
# Write a program that prompts for and reads two numbers (on separate lines
# of input) and prints out the product of the two numbers multiplied together.

use strict;
use warnings;

print "Please enter first value: \n";
chomp (my $num1 = <STDIN>);
print "Please enter second value: \n";
chomp (my $num2 = <STDIN>);
my $num3 = $num1*$num2;
print "The product of first and second values is $num3\n\n";
