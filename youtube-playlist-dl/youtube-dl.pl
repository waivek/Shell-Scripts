my ($html) = @ARGV;
if($html eq '') {
    $html = 'links.html';
}
my $command = q[youtube-dl -f 135 --get-filename -g --ignore-config -o "%(playlist_index)s-%(title)s" https://www.youtube.com/playlist?list=PLckFgM6dUP2hc4iy-IdKFtqR9TeZWMPjm|];
open(PIPE, $command);
# my $it = natatime 2, <PIPE>;
# print "vivek\n";
# while(my ($x, $y) = $it->()) {
#     chomp $x;
#     chomp $y;
#     print "\t<a href=$x>$y</a></br>\n";
# }
my $i = 0;
print "Started!\n";
open my $fh, '>', $html;
print {$fh} "<html>\n";
while(<PIPE>) {
    chomp;
    if($i eq 0) {
        print {$fh} "\t<a href=$_>";
    }
    else {
        print {$fh} "$_</a></br>\n";
        print "Completed: $_\n";
    }
    $i = ($i + 1) % 2;
}
print {$fh} "</html>";
close $fh;
close(PIPE);
