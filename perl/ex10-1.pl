#!/usr/bin/perl -w
# Exercise 10-1
# Written by Santiago Lunar

use strict;

printf "INSTRUCTIONS: \n\n";
printf "Enter a number as asked and when tired of the game please write\
\*exit\*\, \*quit\* or leave blank.\n\n\n";

my $sec = int(1 + rand 100);
# printf "Secret is %s\n\n", $sec;

while (8) {
	print "Please enter a number between 1 and 100: \n";
	chomp(my $num = <STDIN>);
	if ($num =~ /quit|exit|\A\s*\z/i) {
		print "Sorry to see you leave!.\n";
		print "The number was $sec\n";
		last;
	} elsif ($num < $sec) {
		print "Number is too low. Try again!\n";
	} elsif ($num > $sec) {
		print "Number is too high! Try again!\n";
	} else {
		print "Congratz! That was it!\n\n";
		print "That's the number dude!!!!\n\n";
		last;
	}
}