set -e
clear
make $1
echo "Press ENTER to Continue"
read
clear
./$1 db.dat c
./$1 db.dat s 1 zed zed@zedshaw.com
./$1 db.dat s 2 frank frank@zedshaw.com
./$1 db.dat s 3 joe joe@zedshaw.com

correct_output="1 zed zed@zedshaw.com
2 frank frank@zedshaw.com
3 joe joe@zedshaw.com"
OUTPUT="$(./$1 db.dat l)"
if [ "${OUTPUT}" == "$correct_output" ]; then
    echo "Database_list = OK"
else
    echo "Error: Database_list"
fi

correct_output="1 zed zed@zedshaw.com
2 frank frank@zedshaw.com"
./$1 db.dat d 3
OUTPUT="$(./$1 db.dat l)"
if [ "${OUTPUT}" == "$correct_output" ]; then
    echo "Database_delete = OK"
else
    echo "Error: Database_delete"
fi

correct_output="2 frank frank@zedshaw.com"
OUTPUT="$(./$1 db.dat g 2)"
if [ "${OUTPUT}" == "$correct_output" ]; then
    echo "Database_get = OK"
else
    echo "Error: Database_get"
fi

rm -f $1
