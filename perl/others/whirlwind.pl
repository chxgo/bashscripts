#!/usr/bin/perl
# Created by Santiago Lunar from Learning Perl book
use strict;
use warnings;

chomp (my $name = <STDIN>);                     # Standard input. Has \n at the end
                                                # Using chomp function removes \n
my $last = "lunar";
my $city = "santiago";
my $age = 35;
my $is_equal = $name eq $city;                  # Boolean. True in this case.
while ($age gt 0) {
    if ( $is_equal ) {                              # Conditionals can use unary ! NOT operator
        print "Hello $name $last. Your age was $age\n";
        $age -= 5;
        my $sum += $age;
        print "Now is $age\n";
        print "And the variable \$sum is $sum\n";
    } else {
        print "The name and city are not equals\n";
        $age -= 5;
    }
}
