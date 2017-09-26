#!/usr/bin/perl
# Written by Santiago Lunar
# Exercise 6-1

use strict;
use autodie;
use warnings;

printf "Enter a name: ";
chomp(my $name = <STDIN>);

my %family_name = (
  fred      => 'flinstone',
  barney    => 'rubble',
  wilma     => 'flinstone',
  santiago  => 'lunar',
  airam     => 'amoroso',
  maria     => 'gil',
  gerardo   => 'lara',
);

printf "The family name of $name is \n\"%*s\" \n", 20, $family_name{$name};
