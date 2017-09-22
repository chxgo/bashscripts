#!/usr/bin/perl
# Example use of Return operator in a subrutine

use strict;
use warnings;

my @names = qw/ fred barney betty dino wilma pebbles bamm-bamm /;     # My list of names
my $result = &which_element_is("dino", @names);                       # Assing subrutine returned value to scalar context variable

sub which_element_is {                                                # Define subrutine
  my ($what,@array) = @_;                                             # Assing @_ values ("dino" & @names) to $what & @array
  foreach (00..$#array) {                                             # Iterate over each array index element from 00 to n
    if ($what eq $array[$_]) {                                        # Compares $what value to array index
      return $_;                                                      # Return $_ value
    }
  }
  -1;          # Element does not exists
}
