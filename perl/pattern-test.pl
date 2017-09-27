#!/usr/bin/perl
# Test out patterns on whatever you write

while (<>) { # take one input line at a time chomp;
if (/YOUR_PATTERN_GOES_HERE/) {
  print "Matched: |$`<$&>$'|\n"; # the special match vars
} else {
  print "No match: |$_|\n";
  }
}
