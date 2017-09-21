#!/usr/bin/perl
# Created by Santiago Lunar from Learning Perl book

my $name = "santiago";
my $last = "lunar";
my $city = "santiago";
my $is_equal = $name eq $city;                  # Boolean. True in this case.
if ($is_equal) {                                # Conditional
    print "Hello $name $last\n";
} else {
    print "The name and city are not equals\n";
}
