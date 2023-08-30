#!/bin/bash
function get_permissions_verbose () {
	echo $1
	usuario= echo "$1" | cut -c1-3 
	grupo= echo "$1" | cut -c4-6
	demas= echo "$1" | cut -c6-9

}
function rwx () {
	if [ $1 = "r" ]; then
		var="Leer"
	elif [ $1= "w" ]; then
		var="Escribir"
	elif [ $1="x" ]; then
	       var=	"Ejecutar"
	fi

}
if [ -e  "$1" ]; then 
	permisos=$(stat -c %A $1)
	get_permissions_verbose  $permisos
	U=( )
	for (( i=0; i<${#usuario}; i++ ));
	do
		letra=${usuario:i:1}
		if [ $letra="-" ]; then 
			continue
		else
			U+= rwx $letra
		fi
	done
	echo "Usuario:"
	for word in ${U[*]};
	do
		echo $word
	done
else
	echo "no"
	exit 1
fi
