#!/usr/bin/perl
# Written by Santiago Lunar

use strict;
use warnings;
use autodie;

printf "Write some words. After each word press \"Enter\" and when finished typing press Ctrl\+D:\n";
chomp (my @lines = <STDIN>);
printf "Please choose a number for column width: \n";
chomp (my $colWidth = <STDIN>);
printf "1234567890" x 7, "12345\n"; # ruler line to column 75
printf "This is the text you just typed in:\n\n" . ("%${colWidth}s\n" x @lines), @lines;
