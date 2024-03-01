# Docker
En esta sección se explicará el uso de Docker en el proyecto.
Se usa Docker para poder tener un ambiente de desarrollo y producción igual, además de poder tener un ambiente de desarrollo en cualquier sistema operativo.
Docker lo instalaremos en un ordenador host y no en la Jetson Nano, ya que vamos a simular el robot en el ordenador host.

> [!NOTE]
> En este proyecto el ordenador host es un sistema operativo Windows 11, por lo que puede haber algunas diferencias en el uso de Docker en otros sistemas operativos.

## Índice
- [Docker](#docker)
  - [Índice](#índice)
  - [Instalación](#instalación)
  - [Construcción de la imagen](#construcción-de-la-imagen)
  - [Creación del volumen](#creación-del-volumen)
  - [Creación del contenedor](#creación-del-contenedor)
  - [GIU](#giu)

## Instalación
Para instalar Docker, se debe descargar el instalador desde la página oficial de Docker: [Docker Desktop](https://www.docker.com/products/docker-desktop).
Es recomendable descargar los drivers de la tarjeta gráfica para poder usar la aceleración por hardware en la simulación, se explicará más adelante como hacer el pass-through de la tarjeta gráfica a Docker.
Una vez descargado el instalador, se debe ejecutar y seguir los pasos que se indican en el instalador.
Cuando docker esté instalado, se debe reiniciar el ordenador para que los cambios surtan efecto.

## Construcción de la imagen
Una vez reiniciado el ordenador, se debe abrir Docker Desktop, abriremos una terminal para empezar a preparar el entorno de desarrollo y descargaremos el archivo dockerfile.dockerfile proporcionado en este repositorio.
El archivo dockerfile.dockerfile es el archivo que se usará para construir la imagen de Docker, en este archivo se especifica el sistema operativo base, las dependencias y el entorno de desarrollo.

Para construir la imagen, se debe ejecutar el siguiente comando en la termina pero deberemos estar en la carpeta donde se encuentra el archivo dockerfile.dockerfile:
```bash
docker build -t <nombre_de_la_imagen> -f dockerfile.dockerfile .
```

Verificamos que la imagen se haya construido correctamente con el siguiente comando:
```bash
docker images
```
Debería aparecer la imagen que acabamos de construir.

## Creación del volumen
Para poder compartir archivos entre el ordenador host y el contenedor, se debe crear un volumen con el siguiente comando:
```bash
docker volume create <nombre_del_volumen>
```

## Creación del contenedor
Una vez construida la imagen y el volumen, se debe crear el contenedor con el siguiente comando:
```bash
docker run -it -e DISPLAY=host.docker.internal:0.0 -v <nombre_del_volumen>:/root/catkin_ws --net host --gpus=all --name <nombre_del_contenedor> <nombre_de_la_imagen>
```
Con este comando se crea un contenedor con el nombre especificado, con el volumen que hemos creado y con acceso a la tarjeta gráfica del ordenador host.

Para salir del contenedor, se debe ejecutar el siguiente comando:
```bash
exit
```

Para volver a entrar al contenedor, se debe ejecutar el siguiente comando:
```bash
docker exec -it <nombre_del_contenedor> bash
```

Para enceder el contenedor, se debe ejecutar el siguiente comando:
```bash
docker start <nombre_del_contenedor>
```

Para apagar el contenedor, se debe ejecutar el siguiente comando:
```bash
docker stop <nombre_del_contenedor>
```

## GIU
Para poder usar el entorno gráfico en el contenedor, se vamos instalar un servidor Xming en el ordenador host, en este caso se usará el programa [XLaunch](https://sourceforge.net/projects/xming/). Esto permitirá que el contenedor pueda usar el entorno gráfico del ordenador host.
Cuando se instale Xming, se debe ejecutar el programa y seguir los pasos que se indican en el instalador.
Vamos a asegurarnos que XLaunch se ejecuta en "Multiple windows" y que la opción la opción "Display number" esté en 0, el resto de opciones se pueden dejar por defecto.
> [!NOTE]
> Debe estar ejecutándose Xming para que el contenedor pueda usar el entorno gráfico.