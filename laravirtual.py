#! /bin/env python
from os import path

###
#   laravirtual.py
#   Autor: Jonas A. Reyes C. | Telegram: https://jonasroot.t.me
#   Description: Este es un módulo de apoyo a laraserve, el cual verificará
#   si el servidor Xampp tiene habilitado servidores virtuales, esto como
#   primer paso, diagnóstico. Posteriormente se solicitará a usuario
#   información para configurar automáticamente el servidor virtual
#   del proyecto laravel .
#   Last Update: 06-11-2022
#
###

ruta_fich = path.join('./fuentes/','httpd-vhosts.conf')
with open(ruta_fich, 'r') as archivo:
    lines = archivo.readlines()


# Declaramos las variables con las que recogeremos datos
num_vh = 0
num_puerto_vh = ''
ruta_dr = ''
nombre_servidor_virtual = ''
total_vh = 0

# Revisamos las líneas del archivo
for line in lines:
    lineas = line.rstrip()
    linea_separada = lineas.split(' ')

    if '<VirtualHost' in linea_separada:
        num_vh+=1
        indice = linea_separada.index('<VirtualHost')
        num_puerto_vh = linea_separada[indice+1]

    if 'DocumentRoot' in linea_separada:
        indice = linea_separada.index('DocumentRoot')
        ruta_dr = linea_separada[indice+1]

    if 'ServerName' in linea_separada:
        indice = linea_separada.index('ServerName')
        nombre_servidor_virtual = linea_separada[indice+1]

    if '</VirtualHost>' in linea_separada:
        print(f"Servidor nro. {num_vh}")
        print(f"\tVirtualHost: {nombre_servidor_virtual}, Puerto: {num_puerto_vh}")
        print(f"\tDirectorio Raíz: {ruta_dr}")

# numero de líneas
print(f"El archivo tiene {len(lines)} líneas.")

# Buscando servidores virtuales en el documento
total_vh = lines.count( '</VirtualHost>\n')
print(f"Total de Servidores Virtuales detectados: {total_vh}")


