#!/bin/bash
usuario=$1
grupo=$2
useradd -m -p "hola"  $usuario 2> error.txt
cat error.txt

groupadd $grupo  2> error2.txt

cat error2.txt
usermod  -a -G $grupo $usuario
usermod  -a -G $grupo $USER
chown marisoli:$grupo main.sh
chmod 770 main.sh
