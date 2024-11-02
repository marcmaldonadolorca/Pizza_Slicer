# Pizza Slicer

**Pizza Slicer** is an automated robot designed to cut pizzas efficiently, either based on the number of slices or specific ingredients selected by the user.

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
# Pizza Slicer

## Usage Instructions

1. **Install the software and libraries** specified in the [Requirements](#requirements) section.
2. **Run the Pizza_Slicer project** in **Unity**.
3. **Start the server** in **MATLAB** using `ServidorTCP.m`.
4. **Modify `Cliente.java`** in the app to set the IP address of the machine running the **MATLAB** server.
5. **Open the pizzaApp** on your Android device and select the type of cut.

> **Note**: If a Raspberry Pi camera is not available, the app includes test images of different pizza models for simulation purposes.

## MATLAB

### ServidorTCP
This script receives data from the client application and performs the necessary actions to create the requested slices. The code for the connection between the Raspberry Pi and Arduino is commented out due to the simulation context. `ServidorTCP.m` also plots the cuts, making slices at 30-degree angles when possible, or adjusting as needed. If the chosen ingredient is present across the entire pizza, a random slice is chosen; if no ingredient is detected, this function is called directly by the MATLAB server.

### Tests
This script was used to organize the dataset into appropriate folders and rename images correctly, simplifying the training process.

### Detection
Script for training neural networks to detect ingredients. **Weakly supervised semantic segmentation** techniques with image-level annotations were used. Although training with real pizzas was not successful, synthetic pizzas were used, achieving over 90% accuracy for detecting ingredients like pineapple, pepperoni, onions, and olives.

## Mechanics

This module includes all the information related to the robot's mechanics:
- **Servo motor** for rotating the platform to facilitate slicing.
- **Stepper motor** for controlling the cutting blade, aided by two limit switches.

## pizzaApp

This folder contains the Android application responsible for connecting with the robot and sending pizza cutting commands.

### Client
The `Cliente.java` file establishes the connection with `ServidorTCP.m` in **MATLAB** to send the data input by the user through the app.

## Simulation

### 3D Parts
This folder contains the 3D models of the robot:
- **Platform.stl**: Model of the rotating platform.
- **Base.stl**: Model of the robot's base.
- **Pizza_slicer.stl**: Complete and assembled 3D model of the robot.

### Pizza Slicer in Unity
This folder contains all the files and scripts needed for simulating the robot in the **Unity** environment.

## License

Project licensed by the **Autonomous University of Barcelona (UAB)**.

## Authors

- **Marc Maldonado**




