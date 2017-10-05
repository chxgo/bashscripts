#!/usr/bin/perl -w
# Exercise 13-4
# Written by Santiago Lunar

use strict;

print "Please type the name of file to delete: \n";
print "Leave blank for none, or type \* for everything\n";
chomp(my @files = <STDIN>);
my $first = shift @files;		# Check if the first element exists
if (! defined $first or $first =~/\A\s*\z/) {
	print "Filename not specified\n";
	} elsif ($first eq "*") {
		print "You are not allowed to do that!\n";
	} else {
		push @files, $first;
		foreach my $file (@files) {
			print "Deleting $file\n";
			unlink $file or warn "Can't delete file\n$_\n";
	}
}