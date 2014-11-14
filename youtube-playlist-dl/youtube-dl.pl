use List::MoreUtils natatime;
print "<html>\n";
my $it = natatime 2, <STDIN>;
while(my ($x, $y) = $it->()) {
    chomp $x;
    chomp $y;
    print "\t<a href=$x>$y</a></br>\n";
}
print "</html>";
