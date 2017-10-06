#!/usr/bin/perl
# Standard input

use strict;
use warnings;

# version 1
# while (defined(my $line = <STDIN>)) {
#   print "You just wrote: $line\n";
# }

# version 2
# while (<STDIN>) {
#   print "You just wrote $_\n";
# }

# version 3
foreach (<STDIN>) {
  print "$_\n";
}
