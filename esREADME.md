# TANKBOT_V0
Robot modular 4x4 para aprender robotica.

## Índice
- [TANKBOT\_V0](#tankbot_v0)
  - [Índice](#índice)
  - [Introducción](#introducción)
  - [BOM](#bom)
  - [Electrónica](#electrónica)
    - [Jetson Nano Devkit](#jetson-nano-devkit)
    - [Motor](#motor)
    - [Driver](#driver)
    - [Regulador de voltaje](#regulador-de-voltaje)
    - [Batería](#batería)
    - [Lidar](#lidar)
    - [Cámara](#cámara)
    - [IMU](#imu)
    - [ELRS 2.4Ghz RX](#elrs-24ghz-rx)
  - [CAD](#cad)
    - [Modulos](#modulos)
  - [Simulador](#simulador)
    - [Gazebo](#gazebo)
  - [Sistema operativo](#sistema-operativo)
  - [ROS](#ros)

## Introducción
Este proyecto está pensado para ser un robot que permita aprender robotica, desde un manejo simple con ROS a un manejo autónomo co cun Lidar o con cámaras.

## BOM
Insertar tabla.

## Electrónica
### Jetson Nano Devkit
Este componente está pensado para desarrollo de robótica, llegando a permitir un uso de IA en tiempo real de manera local.

### Motor
Se han sopesado varias opciones y características a la hora de elejir unos motores con escobillas respecto a unos motores sin escobillas. Motivos:
- Precio: Son más baratos calidad precio.
- Facilidad de control: Los motores con escobillas son más fáciles de controlar.
- Potencia: Los motores con escobillas tienen más potencia si comparamos motores con escobillas o sin escobillas del mismo precio.

### Driver
Es importante la elección de un driver que permita controlar los motores y que soporte los picos de corriente que puedan tener los motores. El modelo usado ha sido elejido porque cumple la característica de soportar los picos de corriente y por su reducido tamaño.

### Regulador de voltaje
Por elegir...

### Batería
Se han elegido dos baterías LiPo de 3S 1500mAh en paralelo para alimentar el robot. Este tipo de baterías son ligeras y tienen una gran capacidad de descarga, además de tener un tamaño compacto.
Posiblemente se cambie a una batería de celdas Li-Ion las cuales tienen una mayor densidad energética y son más seguras.

### Lidar
El Lidar es un sensor que permite obtener un mapa de la zona en la que se encuentra el robot. Se ha elegido el modelo RP Lidar C1 por su tamaño y su precio.

### Cámara
Por elegir...

### IMU
Se utilizará un MPU6050 para obtener la orientación del robot permitiendo correcciones en el movimiento del robot.

### ELRS 2.4Ghz RX
Se le ha añadido un receptor de 2.4Ghz para poder controlar el robot de manera remota con una emisora de radiocontrol.

## CAD
Se proporcionan los archivos CAD para que cualquiera pueda imprimir las piezas necesarias para montar el robot.
Los parámetros de impresión se explicarán más adelante en una sección específica.
El robot ha sido diseñado en Fusion 360 siguiendo las pautas del script para exportar un diseño CAD a urdf.
Link del script: https://github.com/syuntoku14/fusion2urdf
### Modulos
Se ha diseñado el chasis del robot de manera que permita añadir módulos de manera sencilla. Las medidas para la creación de los módulos se proporcionarán próximamente.

## Simulador
Se ha exportado el diseño CAD a urdf para poder simular el robot, inicialmente se usará Gazebo.
### Gazebo
Proximamente...

## Sistema operativo
Nvidia proporciona una imagen de Ubuntu 18.04 con soporte para la Jetson Nano Devkit. Para poder usar ROS Noetic en la Jetson Nano Devkit se ha usado una imagen creada por la comunidad. Link a la imagen: https://forums.developer.nvidia.com/t/xubuntu-20-04-focal-fossa-l4t-r32-3-1-custom-image-for-the-jetson-nano/121768

## ROS
Se ha elegido usar ROS Noetic en esta versión del robot debido a la cantidad de información y soporte que tiene ROS Kinetic. Se proporcionará un script para instalar ROS Noetic en la Jetson Nano Devkit.