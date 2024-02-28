# TANKBOT_V0
Robot modular con tracción 4x4 para aprender robotica.
> [!IMPORTANT]
> Bajo desarrollo.

## Índice
- [TANKBOT\_V0](#tankbot_v0)
  - [Índice](#índice)
  - [Introducción](#introducción)
  - [BOM](#bom)
  - [Electrónica](#electrónica)
    - [Jetson Nano Devkit](#jetson-nano-devkit)
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
> [!IMPORTANT]
> Esta sección está en construcción.

Tabla de componentes electrónicos:
| Componente | Cantidad | Link |
|------------|----------|------|
| Jetson Nano Devkit | 1 | [Link](https://developer.nvidia.com/embedded/jetson-nano-developer-kit) |
| DC Motor 12V 421RPM 21.6W | 2 | [Link](https://www.aliexpress.com/item/1005005428153048.html) |
| 10A Dual DC Motor Drive Module | 1 | [Link](https://aliexpress.com/item/1005005600656370.html) |
| 3S 1500mAh LiPo Battery | 2 | [Link](https://chinahobbyline.com/collections/cnhl-voltage-11-1v-3s-lipo-batteries/products/cnhl-black-series-1500mah-11-1v-3s-100c-lipo-battery-with-xt60-plug) |
| RP Lidar C1 | 1 | [Link](https://www.slamtec.ai/product/slamtec-rplidar-c1/) |
| MPU6050 | 1 | [Link](https://www.aliexpress.com/item/1005005281279590.html) |
| ELRS 2.4Ghz RX | 1 | [Link](https://www.aliexpress.com/item/1005005912449261.html) |

Tabla de componentes mecánicos:
| Componente | Cantidad | Link |
|------------|----------|------|
| 2GT Timing Pulley 16 Teeth Bore 5mm | 4 | [Link](https://www.aliexpress.com/item/1005003693756433.html) |
| 2GT Timing Pulley 20 Teeth Bore 8mm | 2 | [Link](https://www.aliexpress.com/item/1005003693756433.html) |
| 2GT Idler Timing Pulley 20 Teeth Bore 5mm | 2 | [Link](https://www.aliexpress.com/item/32817328238.html) |
| 2GT 6mm Closed Loop Rubber Timing Belt 340mm | 2 | [Link](https://www.aliexpress.com/item/1005003420210494.html) |


Tabla de componentes de impresión 3D:
| Componente | Cantidad |
|------------|----------|
| base_link | 1 |



## Electrónica
### Jetson Nano Devkit
Este componente está pensado para desarrollo de robótica, llegando a permitir un uso de IA en tiempo real de manera local.

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
El robot ha sido diseñado en Fusion 360 siguiendo las pautas del [script](https://github.com/syuntoku14/fusion2urdf) para exportar un diseño CAD a urdf.
### Modulos
Se ha diseñado el chasis del robot de manera que permita añadir módulos de manera sencilla. Las medidas para la creación de los módulos se proporcionarán próximamente.

## Simulador
La simulación se va a llevar a cabo en un ordenador con una gráfica Nvidia. Por ello se ha creado un dockerfile usando la imagen de Cuda proporcionada por Nvidia y se ha añadido en el dockerfile la instalación de ROS Noetic.
Usando el script en la sección de CAD se ha exportado el diseño CAD a urdf para simular el robot, inicialmente usando Gazebo.
### Gazebo
Proximamente...

## Sistema operativo
Nvidia proporciona una imagen de Ubuntu 18.04 con soporte para la Jetson Nano Devkit. Para poder usar ROS Noetic en la Jetson Nano Devkit se ha usado una [imagen creada por la comunidad](https://forums.developer.nvidia.com/t/xubuntu-20-04-focal-fossa-l4t-r32-3-1-custom-image-for-the-jetson-nano/121768).

## ROS
Se ha elegido usar ROS Noetic en esta versión del robot debido a la cantidad de información y soporte que tiene ROS Kinetic. Se proporcionará un script para instalar ROS Noetic en la Jetson Nano Devkit.