#!/usr/bin/perl
# Excercise 2-1
# Write a program that computes the circumference of a circle with a radius of
# 12.5. Circumference is 2π times the radius (approximately 2 times 3.141592654).
# The answer you get should be about 78.5

print "Please enter the radius: \n";
chomp (my $radius = <STDIN>);
if ($radius le 0) {
    print "The radius you've entered is invalid, so the circumference will be Zero\n";
    print "Please try again\n";
} else {
my $pi = 3.141592652;
my $circumference = $radius*(2*$pi);
print "The total circumference of the circle is $circumference\n";
}
