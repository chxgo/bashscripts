#!/usr/bin/perl -w
# Exercise 9-2
# Written by Santiago Lunar

use strict;					# Enforce good programming rules

$^I = ".out";				# Set backups to .OUT

while (<>) {
	s/fred/Larry/gi;
	print;
}