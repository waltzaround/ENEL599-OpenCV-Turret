# ENEL599 OpenCV Face-Detecting Turret

Enough schematics and code to put together a basic face-detecting sentry gun. The frame I originally built to house this consistently destroyed itself without fail so I'll leave it to you to improvise if you choose to fork this project. The system is built using a webcam, two speakers, a DC motor, an arduino and a PC. The system starts up by sweeping the room the turret is in using the motor to move the webcam. If the webcam detects a face, the speakers will start making PEW PEW noises and the motor will stop until no faces are detected, and continue sweeping the room. The original plan was to use a NERF gun, but the gearbox melted... Leaving me to rejig the code to use speakers.

Written for the ENEL599 Physical Computing Paper at Auckland University of Technology

##Setup Instructions

1. Make sure you have [processing](https://processing.org/) installed and a free USB port on your computer.
2. Make sure you have the [Arduino IDE](https://www.arduino.cc/) installed and a spare Arduino board of any kind. I have used an Arduino UNO in the example.
3. Start putting together a turret frame that holds speakers and a webcam rotated by a motor. Will leave it to your imagination on this one.
4. Connect the motor to your arduino as referenced in `Fritzing Schematics/turret.fzz`
5. Upload the Arduino code to your Arduino via USB (make sure you reference the right one if you aren't using an UNO)
6. Keep the arduino connected via USB after updating. (Important!)
7. Make sure the webcam and speakers are connected to the computer
8. Run the processing Sketch in`Processing Code/TurretV4/TurretV4.pde`.
9. Look at it to hear PEW PEW noises!


## Licence

###THE BEER-WARE LICENSE (Revision 42):

[Walter Lim](mailto:waltissomewhere@gmail.com) wrote this project.  As long as you retain this notice you can do whatever you want with this stuff. If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.

Enjoy :)


