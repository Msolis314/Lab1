#!/bin/bash
pi=$1
Lab1=$2
useradd -m -p "hola"  $pi 2> error.txt
cat error.txt

groupadd $Lab1  2> error2.txt

cat error2.txt
usermod  -a -G $Lab1 $pi
usermod  -a -G $Lab1 $USER
chown :$Lab1 main.sh
#Se le asignan todos los permisos inluyendo el de ejecucion a los miembros del grupo
chmod 070 main_new.sh
