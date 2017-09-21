#!/usr/bin/perl
# Created by Santiago Lunar from Learning Perl book
<<<<<<< HEAD
@lines = `perldoc -u -f atan2`;
foreach (@lines) {
=======
#!/usr/bin/perl
@lines = `perldoc -u -f atan2`;
  foreach (@lines) {
>>>>>>> 9cafa68b12d2db7552bea36c8338e330f7da6330
  s/\w<([^>]+)>/\U$1/g;
  print;
}
