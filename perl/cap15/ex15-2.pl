#!/usr/bin/perl -w
# Exercise 15-1
# Written by Santiago Lunar

use strict;

open STDOUT, '>', 'ls.out' or die "Cannot write file:\n$!";
open STDERR, '>', 'ls.err' or die "Cannot write file:\n$!";

chdir '/' or die "Cannot change to root dir: $!";
open my $list_fh, '-|', 'ls -l' or die "Cannot list content:\n$!";
while (<$list_fh>) {
	chomp;
	print "$_\n";
}
close $list_fh;