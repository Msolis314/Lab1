#!/bin/bash
usuario="fifi"
grupo="Lab1"

sudo  useradd -m $usuario 2> error.txt
cat error.txt

sudo  groupadd $grupo 2> error2.txt

cat error2.txt

sudo usermod  -aG $grupo $usuario
sudo usermod  -aG $grupo $USER

chmod 770 $1
