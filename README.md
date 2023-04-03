# Interactive-Devices: Bird Watching Game

This project is an interactive bird watching game aimed at teaching the user about the large variety of bird species that exist in the wild. For more information about the artistic vision, go here: https://medium.com/@ah3820/interactive-devices-bird-watching-game-76b8dafcaa97

A video demo of the project can be seen here: https://youtu.be/9FE1f6RxlV8

The goal of this project was to create an interactive and engaging game that would encourage people to learn about bird diversity and how to identify different bird species'. To recreate the project, you will need a microcontroller (I used an ESP32) and a joystick to gather sensor data. The joystick.ino file contains the code that needs to be flashed onto the microcontroller. To open up the game window, open the module_2 folder as a Processing project. This folder contains the background and binocular artwork.

To create a working serial connection between Arduino and Processing, make sure that the baud rate in both programs is the same, and that the correct serial port is chosen in Processing (from the list in line 40). Once the code is running on the microcontroller, moving the joystick should cause the binoculars on the screen to move around. It is also important to make sure that the joystick is connected to the correct pins on the microcontroller: ground should be connected to ground, 5V should be connected to 5V (or 3V), the X-axis input should be connected to pin 2, and the Y-axis should be connected to pin 15. The Z-axis pin is not necessary since it just functions as a button. The hardware setup should look something like this:

![IMG_8881](https://user-images.githubusercontent.com/34355688/229398931-0a538811-f9eb-4736-b438-263799e7dd0d.JPG)


For information on recreating the enclosure artwork, see the article linked above.


