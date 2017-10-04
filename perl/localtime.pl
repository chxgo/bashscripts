#!/usr/bin/perl -w
# Use of localtime
# Written by Santiago Lunar

use strict;

my $timestamp = 1454133253; 
my($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime $timestamp;
printf "The time is %s %s\, %s \- %s:%s:%s\n", $mon, $wday, $year, $hour, $min, $sec;
