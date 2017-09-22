#!/usr/bin/perl
# Exercise 3-3
# Write a program that reads a list of strings (on separate lines) until end-ofinput.
# Then it should print the strings in code point order. That is, if you enter
# the strings fred, barney, wilma, betty, the output should show barney betty
# fred wilma. Are all of the strings on one line in the output or on separate lines?
# Could you make the output appear in either style?

#use v5.12;                 # Implicitly use the strict pragma
#use strict;                # Good programming rules
use warnings;

print "Write some words. After each word press \"Enter\" and when finished press Ctrl\+D:\n";
chomp (@string = <STDIN>);
$shiString = shift (@string);
print "This is shift result $shiString\n";
@string = sort (@string);
print "Your words in code point order are: @string\n\n";
#print sort <STDIN>;
