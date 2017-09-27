#!/usr/bin/perl
# Exercise 8-1

while (<>) {
  chomp;
  if (/(a)\b/) {
    print "Matched: |$`<$&>$'|\n";
  } else {
    print "No match: |$_|\n";
  }
}
