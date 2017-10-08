#!/usr/bin/perl -w
# Exercise 15-1
# Written by Santiago Lunar

use strict;

chdir '/' or die "Cannot change to root dir: $!";
system 'ls -l' or die "Cannot list content:\n$!";