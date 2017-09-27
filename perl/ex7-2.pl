#!/usr/bin/perl
#

use strict;
use warnings;
use autodie;

printf "Please write any text including a dot (.) in it\n";
while(<STDIN>) {
  if (/\.+/) {
      print;
  }
}
