#!/usr/bin/perl -w
# Exercise 13-7
# Written by Santiago Lunar

use strict;
use File::Basename;
use File::Spec;

my ($name, $newname, $linktype) = @ARGV;

if (-d $newname) {
	my $basename = basename $name;
	$newname = File::Spec->catfile($newname, $basename);
}

if ($linktype) {
	print "You are creating a symlink of $name with $newname\n";
	symlink $name, $newname or die "Something went wrong!\n$_\n";
} else {
	print "You're making a hard link.\n";
	link $name, $newname or die "Something went wrong!\n$_\n";
}