#!/usr/bin/perl
# Written by Santiago Lunar
# Regular expressions

# $_ = "yabba dabba doo";
# if (/ba da/) {
#   printf "It was found!\n";
# } else {
#   printf "Try again\n";
# }

while (<STDIN>) {
  chomp;
  if (/\Ahttps?:\/\//) {
    printf "URL was found!\n";
  } else {
    printf "Try again\n";
  }
}
