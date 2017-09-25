#!/usr/bin/perl
# Use of the Diamond operator

#use strict;
use warnings;
my $sum = 1;

# version 1
# while (defined(my $line = <>)) {
#   chomp ($line);
#   print "Line $sum was: \"$line\"\n";
#   $sum += 1;
# }

# version 2
while (<>) {
  chomp;
  $sum += 1;
  printf "Line %s was: \"%*s\"\n", $sum, -8, $_;
}
