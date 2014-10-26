set -e
clear
g++ pdf.cpp -o pdf -lz
echo "g++: pdf.cpp"
echo "Press ENTER to Continue"
read
./pdf
echo "./: pdf"
if [ "$(diff output.txt predicted_output.txt)" == "" ]; then
    echo "op: correct"
else
    echo "op: wrong"
fi
rm -f pdf
rm -f output.txt
echo "rm: pdf"
echo "rm: output.txt"
