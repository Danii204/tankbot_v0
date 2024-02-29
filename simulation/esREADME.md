# Simulation
En esta sección se encuentran los archivos y las instrucciones para simular el robot.
[Vídeo básico de la simulación](https://youtu.be/CtObLVQea98)

> [!IMPORTANT]
> Esta sección está en construcción.

## Índice
- [Simulation](#simulation)
  - [Índice](#índice)
  - [Gazebo](#gazebo)
    - [Instalación](#instalación)
    - [First start](#first-start)

## Gazebo
Gazebo es un simulador de robots que permite simular robots en un entorno 3D. Es posible simular robots con diferentes sensores y actuadores, además de poder simular el comportamiento de los mismos.
Por lo que es una herramienta muy útil para el desarrollo de nuestro robot.

### Instalación
La simulación se realizará en un ordenador usando docker. En la sección de docker se explicará cómo instalar docker y cómo usar el dockerfile, además de cómo podemos tener una interfaz gráfica para poder visualizar la simulación.
Gazebo ya viene instalado con el dockerfile proporcionado en la sección de docker pero tenemos que pasar el paquete para simular el robot.
Para poder psar el paquete llamado (tankbot_description) a la imagen de docker, primero tenemos que descargarlo y con el siguiente comando lo pasamos a la imagen de docker:
```bash
docker cp tankbot_description/ <container_id>:/root/catkin_ws/src
```
Para poder usar este comando, debemos estar dentro del directorio que contiene el paquete (tankbot_description) y debemos tener el contenedor de docker en ejecución.
Con esto ya estamos listos para poder ejecutar la simulación.

### First start
Una vez que ya estamos dentro del contenedor de docker, podemos ejecutar el simulador con el siguiente comando:
```bash
roslaunch tankbot_gazebo gazebo.launch
```
Debería aparecer una ventana con el simulador de Gazebo y el robot en el mundo que hemos creado, si esto no ocurre, es posible que no se hayan seguido correctamente los pasos anteriores.

Ahora vamos a hacer un par más de comprobaciones para asegurarnos de que todo está funcionando correctamente. Vamos a abrir una terminal nueva y vamos a ejecutar el siguiente comando:
```bash
rostopic list
```
Deberíamos ver una lista de los tópicos que están siendo publicados y sus tipos. Si no aparece el tópico llamado /cmd_vel, es posible que no se haya ejecutado correctamente el simulador.

A continuación, vamos a abrir otra terminal nueva y vamos a ejecutar el siguiente comando:
```bash
apt install ros-noetic-teleop-twist-keyboard
rosrun teleop_twist_keyboard teleop_twist_keyboard.py
```
Debería aparecer un mensaje en la terminal que nos indica cómo podemos mover el robot con el teclado. Ahora podemos mover el robot con las teclas del teclado y ver cómo se mueve el robot en el simulador.

> [!TIP]
> Tenemos que haber dado al "play" en la ventana de Gazebo para que el robot se mueva y debemos clicar en la ventana de la terminal que hemos abierto para poder mover el robot con el teclado.

Si todo ha ido bien, ya tenemos el simulador de Gazebo funcionando y podemos empezar a trabajar con él.

