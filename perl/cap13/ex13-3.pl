#!/usr/bin/perl -w
# Exercise 13-1
# Written by Santiago Lunar

use strict;

printf "Please enter a directory name: \n";
chomp(my $userDir = <STDIN>);

if ($userDir =~/\A\s*\z/) {
	print "No directory specified.\nTrying to move to your Home dir.\n";
	chdir or die "Can't chdir to your home dir\n";
} else {
	printf "Trying to move to %s...\n", $userDir;
	chdir $userDir or die "Can't chdir to dir $userDir\n";
}

opendir MYDIR, $userDir or die "Can't open directory $userDir\n";
foreach (readdir MYDIR) {
	print "$_\n";
	}
closedir MYDIR;