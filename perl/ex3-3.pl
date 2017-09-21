#!/usr/bin/perl
# Exercise 3-3
# Write a program that reads a list of strings (on separate lines) until end-ofinput.
# Then it should print the strings in code point order. That is, if you enter
# the strings fred, barney, wilma, betty, the output should show barney betty
# fred wilma. Are all of the strings on one line in the output or on separate lines?
# Could you make the output appear in either style?

#use strict;
use warnings;

print "Write some words. After each word press \"Enter\" and when finished press Ctrl\+D:\n";
chomp (@string = <STDIN>);
@string = sort (@string);
print "Your words in code point order are: @string\n\n";
#print sort <STDIN>;
