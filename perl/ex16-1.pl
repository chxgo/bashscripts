#!/usr/bin/perl -w
# Exercise 16-1
# Written by Santiago Lunar

use strict;

my $filename = "text.test";
open my $fh, '<', $filename
	or die "Can't open '$filename': $!";
chomp(my @strings = <$fh>);

while (1) {
	print "Please write a pattern: ";
	chomp(my $pattern = <STDIN>);
	last if $pattern =~/\A\s*\Z/;	# Ends if pattern is blank
	my @matches = eval { grep /$pattern/, @strings };
	if ($@) {						# If some error from eval...
		print "Error: $@";
	} else {
		my $count = @matches;
		print "There were $count matching strings: \n";
			map "$_\n", @matches;
	}
	print "\n";
}