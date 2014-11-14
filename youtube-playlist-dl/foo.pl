open(PIPE, "ping google.com|");
my $i = 0;
while(<PIPE>) {
    # chomp;
    print "VIVEK BOSE";
    print;
}
close(PIPE);
