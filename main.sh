#!/bin/bash
function get_permissions_verbose () {
  var=$1
	usuario="$(echo $var | cut -c2-4)"
	grupo="$(echo $var | cut -c5-7)"
	demas="$(echo $var | cut -c8-10)"
  echo $var

}
function rwx () {
	if [ $1 = "r" ]; then
		var2="Leer"
	elif [ $1 = "w" ]; then
		var2="Escribir"
	elif [ $1 = "x" ]; then
	       var2="Ejecutar"
	fi

}

if [ -e  "$1" ]; then 
	permisos=$(stat -c %A $1)
	get_permissions_verbose  $permisos
	U=("Usuario:" )
  echo "$usuario"
	for ((i=0;i<${#usuario};i++)); do
    letra=${usuario:i:1}
    if [ $letra = "-" ]; then
      continue
    else
      rwx $letra
      U+=($var2)
    fi
  done
	for word in ${U[*]};
	do
		echo $word
	done
 G=("Grupo:" )
  echo "$grupo"
	for ((i=0;i<${#grupo};i++)); do
    letra=${grupo:i:1}
    if [ $letra = "-" ]; then 
      continue
    else
      rwx $letra
      G+=($var2)
    fi  
  done
	for word in ${G[*]};
	do
		echo $word
	done
 D=("Usuarios:" )
  echo "$demas"
	for ((i=0;i<${#demas};i++)); do
    letra=${demas:i:1}
    if [ $letra = "-" ]; then 
      continue
    else
      rwx $letra
      D+=($var2)
    fi  
  done
	for word in ${D[*]};
	do
		echo $word
	done
else
	echo "no"
	exit 1
fi
