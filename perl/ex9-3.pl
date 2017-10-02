#!/usr/bin/perl -w
# Exercise 9-3
# Written by Santiago Lunar

use strict;					# Enforce good programming rules

$^I = ".out";				# Set backups to .OUT

while (<>) {
	s/fred/wilma/gi;
	s/wilma/fred/gi;
	print;
}