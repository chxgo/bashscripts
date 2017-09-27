#!/usr/bin/perl
# Exercise 8-1

while (<STDIN>) {
  chomp;
  if (/(?<word>\b\w*a\b)/) {
    print "Matched: |$`<$&>$'|\n";
    print  "'word'contains $+{word}\n";
  } else {
    print "No match: |$_|\n";
  }
}
