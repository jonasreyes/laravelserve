# Laravel Serve
## Script para levantar tu proyecto en un servidor que permite acceso desde otros dispositivos de tu Red Local
## Funcionalidades:
- Verifica que tengas instaladas las Dependencias de Laravel.
- Lista la versión de tus dependencias instaladas.
- Verifica si tienes un proyecto de Laravel Sail.
- Verifica que ejecutes el Script desde el interior de un proyecto Laravel.

## Requerimientos:
- GNU/Linux (probado en Archlinux)
- Instalado y configurado el entorno de desarrollo en Laravel.

## Procedimiento para usar el script
1. Descarga los scripts `lserver` y `check_laravel_dependences.sh`.
2. Asignale permiso de ejecución.
3. Otorgales permisos de ejecución y copialos en tu directorio `~/.local/bin/`:
3.1. `$ chmod +x lserver check_laravel_dependences`.
3.2. `$ cp lserver check_laravel_dependences ~/.local/bin/`.
4. Ejecútalo o invócalo desde el interior de tu proyecto Laravel: `~/TuProyectoLaravel/$ lserver`.
