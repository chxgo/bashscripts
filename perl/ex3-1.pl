#!/usr/bin/perl
# Exercise 3-1
# Write a program that reads a list of strings on separate lines until end-ofinput
# and prints out the list in reverse order.

print "Please enter your complete name: \n";
#my @realName = chomp (my @realName = <STDIN>);
my @realName = qw/ Santiago Lunar Millan/;
print "Your complete name is @realName\n\n";
my @sortCompName = sort (@realName);
my @revCompName = reverse (@realName);
print "Your reverse name is @revCompName\n\n";
print "And your sorted name is @sortCompName\n\n";
my $revCompName = reverse (@realName);
print "...and your fully reverse name is $revCompName\n\n";
my $revCompName = @realName;
print "...and it has $revCompName silabes on it.\n\n"
