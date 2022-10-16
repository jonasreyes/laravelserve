#! /bin/bash

######
# Probando la existencia de apps que son parte del entorno de
# LARAVEL en ARCH GNU/Linux
# Autor: Jonas A. Reyes C.
# EMail: jonasreyes@yandex.com
# October 2022
######
EPHP=$(php -v 2>/dev/null | awk '{print $2; exit}')
ECOMPOSER=$(composer --version 2>/dev/null | awk '{print $3; exit}')
EMYSQL=$(mysql --version 2>/dev/null | awk '{print $3}')
EXAMPP=$(xampp version 2>/dev/null | awk '{print $4}')
ESQLITE=$(sqlite3 --version 2>/dev/null | awk '{print $1}')
ELARAVEL=$(laravel --version 2>/dev/null | awk '{print $3}')
EDOCKER=$(docker --version 2>/dev/null | awk '{print $3}')
EDOCKER_COMPOSE=$(docker-compose --version 2>/dev/null | awk '{print $4}')

# Chequearemos primeramente si el sistema del usuario cuenta con Docker y Docker-compose
# para correr proyectos con Laravel Sail
if [ -z $EDOCKER ]; then
  echo "No se ha detectado Docker en su sistema, por lo que no podrá usar Laravel Sail hasta instalarlo."
  EDOCKER="No Detectado."
else
  if [ -z $EDOCKER_COMPOSE ]; then
    echo "Tiene instalado Docker en su sistema, sin embargo para poder usar Laravel Sail"
    echo "precisa instalar 'docker-compose'."
    EDOCKER_COMPOSE="No detectado."
  fi
fi

if [ -z $EPHP ]
then
  echo "No se encuentra PHP instalado de forma nativa, procederemos a buscar si tiene Xampp en su sistema."
    if [ -z $EXAMPP ]; then
      echo "No se encuentra XAMPP instalado en su sistema. No puede continuar."
      exit 1
    fi
else
    # En caso de que el usuario cuente con PHP instalado,
    # procedemos a verificar si cuenta con Bases de Datos.
    # la ausencia de Basese de Datos no tiene que significar
    # la interrupción del arranque del servidor, puesto que
    # puede suceder que el usuario tenga un proyecto LARAVEL
    # que no requiera BBDD. En todo caso se informa al usuario.
    if [ -z $EMYSQL ]; then

      echo "Adevertencia: No se ha detectado MySQL en su sistema, sin embargo puede continuar."
      EMYSQL="No detectado."
    fi

    if [ -z $ESQLITE ]; then
      echo "No se encuentra SQLite3 instalado en su sistema."
      ESQLITE="No detectado."
    fi
fi

# Si el script llega a este punto sabremos que el usuario tiene 
# como mínimo instalado PHP en su sistema.
# Procedemos a verificar que tenga instalado composer en su sistema.
if [ -z $ECOMPOSER ]; then
  echo "No se encuentra Composer instalado en su sistema."
  exit 1
fi

if [ -z $ELARAVEL ]; then
  echo "No se encuentra instalado de manera global en su sistema Laravel Installer,"
  echo "sin embargo puede instalar un proyecto Laravel mediante la instrucción:"
  echo '-->> "composer create-projetc laravel/laravel app-de-ejemplo" <<--'
  echo "Para instalar Laravel Installer de manera Global en su sistema ejecute la siguiente instrucción:" echo "composer global require laravel/installer" fi
  ELARAVEL="No detectado."
fi
# Listamos las versiones de los paquetes dependencias de Laravel
# que sí se encuentran instalados en el sistema de usuario.
cat << EOF
Versión de PHP: $EPHP
Versión de Composer: $ECOMPOSER
Versión de MySQL: $EMYSQL
Versión de XAMPP: $EXAMPP
Versión de SQLite: $ESQLITE
Versión de Laravel: $ELARAVEL
Versión de Docker: $EDOCKER
Versión de Docker-Compose: $EDOCKER_COMPOSE
EOF
