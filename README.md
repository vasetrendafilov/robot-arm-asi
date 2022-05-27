<div id="top"></div>

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://feit.ukim.edu.mk/en/">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Robot Arm ASI3</h3>

  <p align="center">
    Restoration of industrial robot arm
    <br />
   
  </p>
</div>


<!-- ABOUT THE PROJECT -->
## About The Project
![Robot Arm](images/robot_arm.jpg)
![Simple Wiring](images/wiring.jpg)

The main goal of the project was to understand the low-level control and wiring of the servo type motors used in the manipulator and to understand the control algorithms and inverse kinematics of the robot.This project is based on an old industrial robotic manipulator manufactured by FANUC which fell into disrepair throughout its working life. The robot was given a second life as an undergraduate student project to help prepare them for work in the real world. Multiple groups of students worked on the project guided by their professors and teaching assistants achieving the project goals one by one.

Goals:

* Restoring the main robot chassis
* Identifying the types and motors needed for the robot to work
* Fitting the new motors on the robot chassis
* Wiring and testing of each motor
* Deriving the inverse kinematics equations 
* Developing the software for controlling the manipulator

<!-- GETTING STARTED -->
## Getting Started

### DMC5400 Driver Instalation
1. Follow instructions from `Cards\DMC5400\Documentation\5400 v3.0 English.pdf` from page 57 on the respective operating system
2. The driver instalation files are in `Cards\DMC5400\Driver`
3. Use the coresponding dll files from `Cards\DMC5400\Code` and aditional headers in respective programming platform

### Motor Wiring
1. Follow the schematic from `Motor Wiring\Schematic_Motor_wiring_with_DMC5400.pdf`
2. You can edit the schematic in EasyEDA with `Motor Wiring\Motor_wiring_with_DMC5400.json`

### Simulation
1. Open the jupyter notebook `Simulation\Arm.ipynb` and run the first two blocks
2. You can interact with the robot by: joging each joint, set target endefector pose, record and replay the joint movments
3. In the next block you can interpolate between two points 
4. With the fourth one you can draw text

<!-- CONTACT -->
## Contact

Vase Trendafilov - [@TrendafilovVase](https://twitter.com/TrendafilovVase) - vasetrendafilov@gmail.com

Project forked from gitlab where i worked on the project: [https://gitlab.com/stefan.zlatinov/robot-arm-asi3](https://gitlab.com/stefan.zlatinov/robot-arm-asi3)

<p align="right">(<a href="#top">back to top</a>)</p>
