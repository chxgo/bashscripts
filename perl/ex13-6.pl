#!/usr/bin/perl -w
# Exercise 13-6
# Written by Santiago Lunar

use strict;
use File::Basename;
use File::Spec;

my ($name, $newname) = @ARGV;

if (-d $newname) {
	my $basename = basename $name;
	$newname = File::Spec->catfile($newname, $basename);
}

link $name, $newname or die "Something went wrong!\n$_\n";