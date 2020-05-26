# Pizza Slicer 
Robot automatizado cuyo objetivo es cortar pizzas en función del número de trozos o ingredientes seleccionados


# Tabla de contenido
   * [Descripción](#descripción)
   * [Requisitos](#requisitos)
   * [Documentación](#documentación)
   * [Instrucciones de uso](#instrucciones-de-uso)
   * [Matlab](#Matlab)
      * [ServidorTCP](#ServidorTCP)
      * [pruebas](#pruebas)
      * [Deteccion](#Deteccion)
   * [Mecánica](#Mecánica)
   * [pizzaApp](#pizzaApp)
      * [app](#app)
         * [src](#src)
            * [Cliente](#Cliente)
   * [Simulación](#Simulación)
      * [Piezas 3D](#Piezas 3D)
      * [Pizza_Slicer](#Pizza_Slicer)
      
    * [Licencia](#licencia)
    
    * [Autores](#autores)

# descripción

Nuestro proyecto, conocido como Pizza Slicer, se centra en un robot automático el cual tiene como finalidad cortar una pizza de dos maneras diferentes. Con la primera forma, nuestro robot recibirá un número de cortes seleccionado por el usuario mediante una aplicación y realizará los cortes necesarios para la obtención de este número de porciones. Con la segunda forma, el usuario podrá indicar un ingrediente el cual quiere en su porción de pizza y nuestro robot, con la ayuda de una cámara situada en su parte superior, detectara el ingrediente seleccionado por el usuario y realizará el corte para obtener una porción con dicho ingrediente.

# requisitos

Programas:

- Android Studio

- Unity

- Matlab


Add-on Matlab:

- Instrument Control Toolbox v4.2

- MATLAB Support Package for Arduino Hardware

- Simulink

# documentación

Este README muestra como simular el proyecto de Pizza Slicer mediante Unity y enviando las órdenes desde una aplicación Android. En el caso de querer construir el robot físicamente, hay que descomentar el código referente a la conexión entre raspberry y arduino junto con el control de la cámara en los archivos “ServidorTCP.m” situado en la ruta pizzaApp/app/src/Cliente e introducir el código de arduino situado en la carpeta Módulo Mecánica en el archivo Mecanica.ino.


# instrucciones-de-uso

1. Clonar este repositorio.

> git clone https://github.com/marcmaldonadolorca/Pizza_Slicer.git

2. Instalar los programas y librerías especificados en los requisitos.

3. Ejecutar el proyecto Pizza_Slicer en Unity.

4. Iniciar el servidor en MATLAB usando el archivo ServidorTCP.m.

5.Abrir el archivo Cliente.java localizado dentro de la aplicación y cambiar la IP por la IP de la máquina donde vaya a ejecutarse el servidor MATLAB.

6. Abrir la aplicación Android pizzaApp y desde tu móvil ya puedes elegir el tipo de corte

Nota: Al no tener una cámara de  raspberry disponible para las pizzas, en su defecto en la app aparecen 4 fotos de diferentes modelos de pizzas las cuales que pueden utilizar a modo de test.


# Matlab




## ServidorTCP

En este archivo se reciben los datos recibidos por la aplicación del cliente y realiza las acciones necesarias para realizar las porciones que el cliente solicita. Debido a la falta de componentes físicos y la carencia de algunos componentes en el simulador, el código relacionado con la conexión entre la raspberry y el arduino aparece comentado. El resto del código corresponde con la comunicación establecida con unity donde se puede observar el funcionamiento del robot.
Ademàs se encarga de trazar los cortes, intenta cortar un trozo de pizza de 30 grados, en el caso de no poder debido a que no haya suficiente porción de pizza hace un corte con el ángulo que sea posible. Si hay ese ingrediente en toda la pizza, elige un trozo aleatoriamente, en el caso de no detectar ningún ingrediente, la función de este script se llama directamente del servidor de matlab.
## pruebas

Este script se ha utilizado para dividir el dataset en las carpetas correspondientes y tener las imágenes con el nombre correcto para facilitar la tarea de entrenamiento.
## Deteccion

Script para el entrenamiento de las redes neuronales de detección de ingredientes. Estas se han tratado de entrenar con pizzas reales utilizando técnicas de weakly supervised semantic segmentation, concretamente de image-level annotations, esta tarea ha consumido mucho tiempo y no ha dado frutos por lo cual hemos decidido actuar según el plan de contingencia, y hemos usado pizzas sintéticas para entrenar nuestra red neuronal, obteniendo unos resultados de más de 90% de accuracy para cada ingrediente (piña, pepperoni, cebolla y aceitunas). Este script genera archivos .mat que contiene la red.

# Mecánica

En este archivo encontramos todo lo relacionado con la parte mecánica del robot siendo esta un servomotor para rotar el plato y así facilitar el corte de las porciones, un motor paso a paso para controlar la cuchilla a la hora de realizar los cortes con ayuda de dos sensores de final de carrera.


# pizzaApp

Carpeta contenedora de la aplicación Android la cual será la encargada de conectarse con nuestro robot y enviarle las órdenes de corte para las pizzas. Se conecta al archivo ServidorTCP.m situado en la carpeta simulación.

##app
### src
####Cliente

Esta carpeta contiene el archivo Cliente.java el cual será el encargado de establecer la conexión con el archivo ServidorTCP.m situado en la carpeta matlba con el fin de enviar la información que el usuario introduzca en la aplicación

# Simulación

## Piezas 3D

En esta carpeta se encuentran las diferentes piezas de nuestro robot. El archivo Platform.stl contiene el modelo del plato que utiliza nuestro robot. El archivo Base.stl contiene el modelo de la base del robot. El archivo Pizza_slicer.stl contiene el modelo 3D del robot completo y montado.

##Pizza_Slicer

En esta carpeta encontramos todos los archivos relacionados con el modelo 3D y los scripts necesarios para realizar la simulación del robot en el entorno de Unity.


# Licencia

UAB


# Autores

- Javier Arboledas: 1424719 

- Jonatán Luzón: 1281175

- Marc Maldonado: 1492164

- Oriol Puigdomènech: 1426841







