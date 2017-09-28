#!/usr/bin/perl
# Exercise 8-1

while (<STDIN>) {
  chomp;
  if (/(?<word>\b\w*a\b)(?<chars>.{0,5})/) {
    print "Matched: |$`<$&>$'|\n";
    print  "'word'contains $+{word} and 'chars' contains $+{chars}\n";
  } else {
    print "No match: |$_|\n";
  }
}
