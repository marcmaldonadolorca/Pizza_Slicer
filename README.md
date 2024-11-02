# Pizza Slicer

**Pizza Slicer** is an automated robot designed to cut pizzas efficiently, either based on the number of slices or specific ingredients selected by the user.

## Table of Contents
- [Description](#description)
- [Requirements](#requirements)
- [Documentation](#documentation)
- [Usage Instructions](#usage-instructions)
- [MATLAB](#matlab)
  - [ServidorTCP](#servidortcp)
  - [Tests](#tests)
  - [Detection](#detection)
- [Mechanics](#mechanics)
- [pizzaApp](#pizzaapp)
  - [Client](#client)
- [Simulation](#simulation)
  - [3D Parts](#3d-parts)
  - [Pizza Slicer in Unity](#pizza-slicer-in-unity)
- [License](#license)
- [Authors](#authors)

## Description

The **Pizza Slicer** project automates the process of cutting pizzas through a robot that operates in two modes:
1. **By number of slices**: The user selects the desired number of slices through a mobile app, and the robot makes the necessary cuts.
2. **By ingredient**: The user specifies an ingredient to be included in their slice. Using a camera mounted above the robot, it detects the ingredient and makes the appropriate cut to include it.

## Requirements

Necessary software:
- **Android Studio**
- **Unity**
- **MATLAB**

MATLAB Add-ons:
- **Instrument Control Toolbox v4.2**
- **MATLAB Support Package for Arduino Hardware**
- **Simulink**

## Documentation

This `README` explains how to simulate the **Pizza Slicer** project in **Unity** and send commands from an Android app. For building the physical robot, uncomment the code related to the connection between the Raspberry Pi and Arduino, and enable camera control in `ServidorTCP.m`, located in `pizzaApp/app/src/Client`. The Arduino code can be found in `Mecanica.ino` in the **Mechanics** folder.

## Usage Instructions

1. Clone this repository:
   ```bash
   git clone https://github.com/marcmaldonadolorca/Pizza_Slicer.git





