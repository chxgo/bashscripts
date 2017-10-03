#!/usr/bin/perl -w
# Written by Santiago Lunar

use strict;
use File::Basename qw/ basename /;		# Only import one function

my $name = "/usr/bin/perl";
printf my $basename = basename $name;
printf my $dirname = File::Basename::dirname $name; # Using full function name
