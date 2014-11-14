# pass -f 135 for 480p
echo "youtube-dl: Getting URL's"
# youtube-dl --get-filename -g --ignore-config -o "%(playlist_index)s-%(title)s" https://www.youtube.com/playlist?list=PLckFgM6dUP2hc4iy-IdKFtqR9TeZWMPjm > foo
youtube-dl --get-filename -g --ignore-config -o "%(playlist_index)s-%(title)s" https://www.youtube.com/playlist?list=PLckFgM6dUP2hc4iy-IdKFtqR9TeZWMPjm > foo
echo "youtube-dl: URL's retrieved"
perl youtube-dl.pl < foo
