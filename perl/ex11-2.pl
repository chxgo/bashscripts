#!/usr/bin/perl -w
# Exercise 11-2
# Written by Santiago Lunar

use strict;
use Time::Moment;
my $currentTime = Time::Moment->now;
my $consoleTime = Time::Moment->new(
	year 	=> $ARGV[0],
	month 	=> $ARGV[1],
	);
my $years = $consoleTime->delta_years($currentTime);
my $months = $consoleTime->delta_months($currentTime) %12;
my $days = $consoleTime->delta_days($currentTime) %31;

printf "%d years\, %d months and %d days\n", $years, $months, $days;