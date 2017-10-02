#!/usr/bin/perl -w
# Exercise 9-4
# Written by Santiago Lunar

use strict;					# Enforce good programming rules

$^I = ".out";				# Set backups to .OUT

while (<>) {
	s/(perl)/$&\n## Copyright (C) 2017 by Santiago Lunar\n/;
	print;
}