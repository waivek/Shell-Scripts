#!/usr/bin/perl
use strict;
use warnings;
my ($url) = @ARGV;
# https://www.youtube.com/playlist?list=PLckFgM6dUP2hc4iy-IdKFtqR9TeZWMPjm
print "Getting Name of Playlist at $url\n";
my $filename = `youtube-dl --playlist-end 1 --get-filename --ignore-config -o "%(playlist)s" $url`;
chomp $filename;
$filename = $filename . '.html';
print "$filename: Started\n";
# my $command = "youtube-dl -f 135 --get-filename -g --ignore-config -o \"%(playlist_index)s-%(title)s\" $url|";
my $command = "youtube-dl --get-filename -g --ignore-config -o \"%(playlist_index)s-%(title)s\" $url|";
open(PIPE, $command);
my $i = 0;
open my $fh, '>', $filename;
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
