#!/bin/bash
pi=$1
Lab1=$2
Pas=$3
echo "$Pas" | sudo  useradd -m -p "hola"  $pi 2> error.txt
cat error.txt

echo "$Pas" | sudo groupadd $Lab1  2> error2.txt

cat error2.txt
echo "$Pas" | sudo  usermod  -a -G $Lab1 $pi
echo "$Pas" | sudo  usermod  -a -G $Lab1 $USER
echo "$Pas" | sudo  chown :$Lab1 main.sh
echo "$Pas" | sudo chmod 070 main.sh
