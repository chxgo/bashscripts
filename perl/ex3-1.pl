#!/usr/bin/perl
# Exercise 3-1
# Write a program that reads a list of strings on separate lines until end-ofinput
# and prints out the list in reverse order.

my @completeName = qw/ Santiago Rafael Lunar Millan /;
print "Your complete name is @completeName\n\n";
my @sortCompName = sort @completeName;
my @revCompName = reverse @completeName;
print "Your reverse name is @revCompName\n\n";
print "And your sorted name is @sortCompName\n\n";
my $revCompName = reverse @completeName;
print "...and your fully reverse name is $revCompName\n\n";
my $revCompName = @completeName;
print "...or $revCompName \n\n"
