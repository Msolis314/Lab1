function get_permissions_verbose () {
  var=$1
	usuario="$(echo $var | cut -c2-4)"
	grupo="$(echo $var | cut -c5-7)"
	demas="$(echo $var | cut -c8-10)" 
	#Esta funcion corta el string y lo divide entre los usuarios

}
function rwx () {       
	#esta funcion asocia la letra con el permiso
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
	#Array vacio de usuario
  #Loop para iterar por los permisos del usuario y pasar cada letra por rwx
	for ((i=1;i<4;i++)); do
    letra="$(echo $usuario | cut -c$i-$i)"
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
 #Array vacio del grupo
  
	for ((i=1;i<4;i++)); do
    letra="$(echo $grupo | cut -c$i-$i)"
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
 #Array vacio de usuarios
  
	for ((i=1;i<4;i++)); do
    letra="$(echo $demas | cut -c$i-$i)"
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
	echo "No existe el archivo"   
       	#Si el archivo no existe da un mensaje de error
	exit 1
fi
